#!/usr/bin/env python3
"""Enrich website/tags-data/*.json with `compressed_size` + `uncompressed_size`.

The Tags tab on per-image pages shows size info per tag. GitHub's packages
API doesn't carry sizes, so we hit the OCI registry directly:

  - `compressed_size`: sum of `manifest.layers[].size` (cheap; manifest JSON
    fetch only). What you pull over the wire.
  - `uncompressed_size`: sum of decompressed layer sizes. Requires fetching
    each layer blob and streaming through gzip. Globally deduped by layer
    digest because nix-containers images share base layers heavily.

Reads/writes JSON in place. Adds null fields when the manifest can't be
resolved so the renderer can show "—".

Usage:
  enrich-tags-with-size.py <tags-data-dir>
"""
from __future__ import annotations

import concurrent.futures
import gzip
import json
import os
import sys
import threading
import time
import urllib.error
import urllib.request

REGISTRY = "ghcr.io"
REPO_PREFIX = "nix-containers/images"

# Layer-blob downloads can be big — extend the HTTP timeout. The
# decompression itself is CPU-bound and runs after read.
BLOB_TIMEOUT = 300
MANIFEST_TIMEOUT = 30

# Wall-clock budget for the *uncompressed* sizing pass (env-overridable).
# Compressed sizes come free from the manifest, but uncompressed requires
# downloading + gunzipping every unique layer blob — for a large catalog with
# many freshly-pushed images not yet in the snapshot, that can take tens of
# minutes and stall the whole deploy. Once the budget is spent we stop starting
# new blob downloads: those tags keep their compressed size and get a null
# uncompressed size (rendered "—"), which fills in on later runs as layers land
# in the snapshot cache. 0 disables the budget.
UNCOMPRESSED_BUDGET_SECONDS = int(os.environ.get("ENRICH_UNCOMPRESSED_BUDGET", "420"))
_deadline: float | None = None

# Order matters — registries can return either an OCI index or a Docker
# manifest list as the top-level when an image is multi-platform.
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

# Global cache shared across all images: layer digest → uncompressed
# bytes (None if the fetch+decompress failed). Layers are addressed by
# content-hash so digests are stable across images that share them.
# A lock guards population to keep concurrent enrichers from racing on
# duplicate fetches; the cost of the lock is irrelevant next to a 30 MB
# layer download.
_layer_size_cache: dict[str, int | None] = {}
_layer_cache_lock = threading.Lock()


def _get_json(url: str, *, accept: str = "", token: str = "") -> dict:
    req = urllib.request.Request(url)
    if accept:
        req.add_header("Accept", accept)
    if token:
        req.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(req, timeout=MANIFEST_TIMEOUT) as resp:
        return json.load(resp)


def _decompressed_size(url: str, token: str) -> int | None:
    """Stream a gzipped blob through the decompressor and return total
    decompressed bytes. None on any error (network, decode, etc.)."""
    req = urllib.request.Request(url)
    req.add_header("Authorization", f"Bearer {token}")
    try:
        with urllib.request.urlopen(req, timeout=BLOB_TIMEOUT) as resp:
            total = 0
            with gzip.GzipFile(fileobj=resp) as gz:
                while True:
                    chunk = gz.read(1 << 16)
                    if not chunk:
                        break
                    total += len(chunk)
            return total
    except (urllib.error.URLError, OSError, EOFError):
        return None


def anonymous_token(image: str) -> str | None:
    """GHCR public packages accept anonymous pulls — fetch a scoped
    bearer token without auth so we don't burn an authed quota."""
    url = (
        f"https://{REGISTRY}/token?service={REGISTRY}"
        f"&scope=repository:{REPO_PREFIX}/{image}:pull"
    )
    try:
        return _get_json(url).get("token")
    except (urllib.error.URLError, json.JSONDecodeError, KeyError):
        return None


def _resolve_leaf_manifest(image: str, digest: str, token: str) -> dict | None:
    """Return the leaf manifest (with a `layers` array) for a given
    top-level manifest digest. Drills into the linux/amd64 sub-manifest
    when the top level is an OCI index / manifest list."""
    url = f"https://{REGISTRY}/v2/{REPO_PREFIX}/{image}/manifests/{digest}"
    try:
        top = _get_json(url, accept=INDEX_ACCEPT, token=token)
    except (urllib.error.URLError, json.JSONDecodeError):
        return None
    if top.get("layers"):
        return top
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
        return _get_json(sub_url, accept=LEAF_ACCEPT, token=token)
    except (urllib.error.URLError, json.JSONDecodeError):
        return None


def sizes_for_digest(image: str, digest: str, token: str) -> tuple[int | None, int | None]:
    """Return (compressed_size, uncompressed_size) for one manifest digest.

    Compressed is summed directly from manifest.layers[].size.
    Uncompressed walks the same layer list, fetches each blob from the
    global cache (or populates the cache on miss by streaming through
    gzip). Returns nulls when any layer fails so callers can fall back
    cleanly."""
    leaf = _resolve_leaf_manifest(image, digest, token)
    if not leaf:
        return None, None
    layers = leaf.get("layers") or []
    if not layers:
        return None, None
    compressed = sum(layer.get("size", 0) for layer in layers)
    uncompressed = 0
    for layer in layers:
        ldig = layer.get("digest")
        if not ldig:
            return compressed, None
        with _layer_cache_lock:
            cached = _layer_size_cache.get(ldig, "miss")
        if cached == "miss":
            # Past the budget: don't start new blob downloads. Keep the
            # compressed size (already known) and return a null uncompressed so
            # the deploy isn't held hostage by a cold cache full of fresh images.
            if _deadline is not None and time.monotonic() > _deadline:
                return compressed, None
            blob_url = f"https://{REGISTRY}/v2/{REPO_PREFIX}/{image}/blobs/{ldig}"
            measured = _decompressed_size(blob_url, token)
            with _layer_cache_lock:
                # Race-tolerant: if another thread populated meanwhile,
                # prefer whichever value is not None.
                if ldig not in _layer_size_cache:
                    _layer_size_cache[ldig] = measured
                cached = _layer_size_cache[ldig]
        if cached is None:
            # One bad layer poisons the per-tag uncompressed total —
            # better than reporting a wrong (lower) number.
            return compressed, None
        uncompressed += cached
    return compressed, uncompressed


def enrich_one(file_path: str) -> tuple[str, int, int]:
    """Enrich a single tags file. Returns (image, enriched_count, total).
    `enriched` is the number of tags that got *both* sizes populated."""
    image = os.path.basename(file_path).removesuffix(".json")
    with open(file_path) as f:
        tags = json.load(f)
    if not tags:
        return image, 0, 0

    # Sizes are content-addressed by manifest digest and never change, so a
    # tag that already carries BOTH sizes (seeded from the previous run's
    # snapshot) needs no re-fetching. Only size the digests still missing — this
    # is what lets the per-run uncompressed budget ACCUMULATE to full coverage
    # across runs instead of re-doing everything and losing to the budget each
    # time (which under-counted the catalog size totals).
    def _sized(t: dict) -> bool:
        return t.get("compressed_size") is not None and t.get("uncompressed_size") is not None

    need_digests = {t.get("digest") for t in tags if t.get("digest") and not _sized(t)}
    if not need_digests:
        # Fully seeded from the snapshot — nothing to fetch.
        return image, sum(1 for t in tags if _sized(t)), len(tags)

    token = anonymous_token(image)
    if not token:
        for tag in tags:
            tag.setdefault("compressed_size", None)
            tag.setdefault("uncompressed_size", None)
        with open(file_path, "w") as f:
            json.dump(tags, f, separators=(",", ":"))
        return image, sum(1 for t in tags if _sized(t)), len(tags)

    # Only compute the digests that aren't already sized (dedup: `latest` and
    # the version tag usually share a digest).
    digest_to_sizes: dict[str, tuple[int | None, int | None]] = {}
    for digest in need_digests:
        digest_to_sizes[digest] = sizes_for_digest(image, digest, token)

    for tag in tags:
        dg = tag.get("digest")
        if dg in digest_to_sizes:
            c, u = digest_to_sizes[dg]
            tag["compressed_size"] = c
            tag["uncompressed_size"] = u
        # tags not in digest_to_sizes keep their already-seeded sizes

    with open(file_path, "w") as f:
        json.dump(tags, f, separators=(",", ":"))
    return image, sum(1 for t in tags if _sized(t)), len(tags)


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
    print(f"Enriching {len(files)} tags files with compressed + uncompressed sizes...")
    global _deadline
    if UNCOMPRESSED_BUDGET_SECONDS > 0:
        _deadline = time.monotonic() + UNCOMPRESSED_BUDGET_SECONDS
        print(f"Uncompressed-size budget: {UNCOMPRESSED_BUDGET_SECONDS}s "
              f"(compressed sizes are always computed; uncompressed is best-effort).")
    total_tags = 0
    total_enriched = 0
    misses: list[str] = []
    # 4-way parallelism (down from 8): each worker may pull several
    # 10-100 MB blobs serially before the global cache fills, so the
    # bottleneck is bandwidth not requests. Going higher hurts more than
    # it helps and risks tripping anonymous-pull throttles.
    failures: list[str] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as ex:
        futs = {ex.submit(enrich_one, f): f for f in files}
        for fut in concurrent.futures.as_completed(futs):
            # A single image's manifest/blob fetch failing (transient registry
            # error, throttle, a just-pushed tag) must not abort the whole site
            # build — log it and move on. Size data is best-effort enrichment.
            try:
                image, enriched, total = fut.result()
            except Exception as e:  # noqa: BLE001 - deliberately broad
                failures.append(f"  {os.path.basename(futs[fut])}: {e}")
                continue
            total_tags += total
            total_enriched += enriched
            if total and enriched < total:
                misses.append(f"  {image}: {enriched}/{total} tags fully sized")
    if failures:
        print(f"{len(failures)} images could not be sized (skipped, non-fatal):")
        for m in failures[:25]:
            print(m)
        if len(failures) > 25:
            print(f"  ...and {len(failures) - 25} more.")
    print(
        f"Enriched {total_enriched}/{total_tags} tags across {len(files)} images. "
        f"Layer cache: {sum(1 for v in _layer_size_cache.values() if v is not None)} hits "
        f"/ {len(_layer_size_cache)} unique digests."
    )
    if _deadline is not None and time.monotonic() > _deadline:
        print("Uncompressed-size budget reached — remaining tags kept their "
              "compressed size with a null uncompressed size (fills in next run).")
    if misses:
        print("Partial misses:")
        for m in misses[:25]:
            print(m)
        if len(misses) > 25:
            print(f"  ...and {len(misses) - 25} more.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
