#!/usr/bin/env python3
"""Enrich website/tags-data/*.json files with `compressed_size` per tag.

The Tags tab on per-image pages shows tag/digest/pushed-at. We also want
a compressed-size column, but GitHub's packages API doesn't include
manifest sizes — only the registry's OCI manifest does. So for each
image, we anonymously fetch a bearer token from ghcr.io, then call
`/v2/<name>/manifests/<digest>` per unique digest and sum the layer
sizes.

Reads/writes JSON in place. Adds a `compressed_size` field (int, bytes)
to each tag entry. Tags whose manifest can't be resolved keep
`compressed_size: null` so the renderer can show "—".

Usage:
  enrich-tags-with-size.py <tags-data-dir>
"""
from __future__ import annotations

import concurrent.futures
import json
import os
import sys
import urllib.error
import urllib.request

REGISTRY = "ghcr.io"
REPO_PREFIX = "nix-containers/images"

# Order matters — registries can return either an OCI index or a Docker
# manifest list as the top-level when an image is multi-platform. We
# offer to accept both so we don't get a 415.
INDEX_ACCEPT = ", ".join([
    "application/vnd.oci.image.index.v1+json",
    "application/vnd.docker.distribution.manifest.list.v2+json",
    "application/vnd.docker.distribution.manifest.v2+json",
    "application/vnd.oci.image.manifest.v1+json",
])
LEAF_ACCEPT = ", ".join([
    "application/vnd.oci.image.manifest.v1+json",
    "application/vnd.docker.distribution.manifest.v2+json",
])


def _get(url: str, *, accept: str = "", token: str = "") -> dict:
    req = urllib.request.Request(url)
    if accept:
        req.add_header("Accept", accept)
    if token:
        req.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.load(resp)


def anonymous_token(image: str) -> str | None:
    """GHCR public packages accept anonymous pulls — fetch a scoped
    bearer token without auth so we don't burn an authed quota."""
    url = (
        f"https://{REGISTRY}/token?service={REGISTRY}"
        f"&scope=repository:{REPO_PREFIX}/{image}:pull"
    )
    try:
        return _get(url).get("token")
    except (urllib.error.URLError, json.JSONDecodeError, KeyError):
        return None


def compressed_size_for_digest(image: str, digest: str, token: str) -> int | None:
    """Return the compressed (on-the-wire) size in bytes for one manifest.

    For multi-platform images, the top-level returns an OCI index; we
    drill into the linux/amd64 sub-manifest and sum its layers. For
    single-platform images, the top-level already has `layers[]`.
    """
    url = f"https://{REGISTRY}/v2/{REPO_PREFIX}/{image}/manifests/{digest}"
    try:
        top = _get(url, accept=INDEX_ACCEPT, token=token)
    except (urllib.error.URLError, json.JSONDecodeError):
        return None
    layers = top.get("layers") or []
    if layers:
        return sum(layer.get("size", 0) for layer in layers)
    # Fallthrough: it's an index/manifest list. Resolve the linux/amd64
    # entry. (We don't support arm64 sizes yet — could be added when the
    # site grows a platform selector.)
    sub_digest = None
    for m in top.get("manifests") or []:
        platform = m.get("platform") or {}
        if platform.get("architecture") == "amd64" and platform.get("os") == "linux":
            sub_digest = m.get("digest")
            break
    if not sub_digest:
        return None
    sub_url = f"https://{REGISTRY}/v2/{REPO_PREFIX}/{image}/manifests/{sub_digest}"
    try:
        sub = _get(sub_url, accept=LEAF_ACCEPT, token=token)
    except (urllib.error.URLError, json.JSONDecodeError):
        return None
    return sum(layer.get("size", 0) for layer in (sub.get("layers") or []))


def enrich_one(file_path: str) -> tuple[str, int, int]:
    """Enrich a single tags file. Returns (image_name, enriched_count,
    total_count) so the caller can log misses without spamming stdout
    per-success."""
    image = os.path.basename(file_path).removesuffix(".json")
    with open(file_path) as f:
        tags = json.load(f)
    if not tags:
        return image, 0, 0

    token = anonymous_token(image)
    if not token:
        # Still write back with explicit nulls so render-time can show "—".
        for tag in tags:
            tag.setdefault("compressed_size", None)
        with open(file_path, "w") as f:
            json.dump(tags, f, separators=(",", ":"))
        return image, 0, len(tags)

    # One HTTP call per unique digest — many tags share digests (e.g.
    # `latest` and the version tag point at the same manifest).
    digest_to_size: dict[str, int | None] = {}
    for tag in tags:
        digest = tag.get("digest")
        if digest and digest not in digest_to_size:
            digest_to_size[digest] = compressed_size_for_digest(image, digest, token)

    enriched = 0
    for tag in tags:
        size = digest_to_size.get(tag.get("digest"))
        tag["compressed_size"] = size
        if size is not None:
            enriched += 1

    with open(file_path, "w") as f:
        json.dump(tags, f, separators=(",", ":"))
    return image, enriched, len(tags)


def main(argv: list[str]) -> int:
    if len(argv) != 2:
        print("usage: enrich-tags-with-size.py <tags-data-dir>", file=sys.stderr)
        return 2
    tags_dir = argv[1]
    files = sorted(
        os.path.join(tags_dir, f)
        for f in os.listdir(tags_dir)
        if f.endswith(".json")
    )
    print(f"Enriching {len(files)} tags files with manifest sizes...")
    total_tags = 0
    total_enriched = 0
    misses: list[str] = []
    # 8-way parallelism mirrors the upstream tag-fetch step; GHCR
    # anonymous pulls are not strict but 16 concurrent did trip the
    # secondary rate limit previously.
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as ex:
        for image, enriched, total in ex.map(enrich_one, files):
            total_tags += total
            total_enriched += enriched
            if total and enriched < total:
                misses.append(f"  {image}: {enriched}/{total} tags sized")
    print(f"Enriched {total_enriched}/{total_tags} tags across {len(files)} images.")
    if misses:
        print("Partial misses:")
        for m in misses[:25]:
            print(m)
        if len(misses) > 25:
            print(f"  ...and {len(misses) - 25} more.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
