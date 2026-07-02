#!/usr/bin/env python3
"""Seed freshly-generated tags-data with sizes from the previous run's snapshot.

The deploy regenerates website/tags-data/*.json each run (tags + digests, no
sizes) and then enriches under a wall-clock budget. Without carrying prior
sizes forward, every run re-sizes from scratch and the budget only covers a
fraction — under-counting the catalog size totals.

Sizes are content-addressed by manifest digest and never change, so we build a
digest -> (compressed, uncompressed) map from the cached snapshot and apply it
to any fresh tag with a matching digest. The enricher then only has to size the
genuinely-new digests, so coverage accumulates to 100% across a few runs.

Usage: merge-cached-sizes.py <fresh-tags-dir> <cached-snapshot-dir>
"""
from __future__ import annotations

import json
import os
import sys


def build_size_map(cached_dir: str) -> dict[str, tuple[int, int]]:
    sizes: dict[str, tuple[int, int]] = {}
    if not os.path.isdir(cached_dir):
        return sizes
    for fn in os.listdir(cached_dir):
        if not fn.endswith(".json"):
            continue
        try:
            with open(os.path.join(cached_dir, fn)) as f:
                tags = json.load(f)
        except (OSError, json.JSONDecodeError):
            continue
        for t in tags if isinstance(tags, list) else []:
            dg = t.get("digest")
            c, u = t.get("compressed_size"), t.get("uncompressed_size")
            if dg and c is not None and u is not None and dg not in sizes:
                sizes[dg] = (c, u)
    return sizes


def main(argv: list[str]) -> int:
    if len(argv) != 3:
        print("usage: merge-cached-sizes.py <fresh-tags-dir> <cached-snapshot-dir>",
              file=sys.stderr)
        return 2
    fresh_dir, cached_dir = argv[1], argv[2]
    sizes = build_size_map(cached_dir)
    if not sizes:
        print("No cached sizes to seed (snapshot missing/empty); enricher starts cold.")
        return 0

    seeded = files = 0
    for fn in os.listdir(fresh_dir):
        if not fn.endswith(".json"):
            continue
        path = os.path.join(fresh_dir, fn)
        try:
            with open(path) as f:
                tags = json.load(f)
        except (OSError, json.JSONDecodeError):
            continue
        if not isinstance(tags, list):
            continue
        changed = False
        for t in tags:
            dg = t.get("digest")
            if dg in sizes and (t.get("compressed_size") is None
                                or t.get("uncompressed_size") is None):
                t["compressed_size"], t["uncompressed_size"] = sizes[dg]
                seeded += 1
                changed = True
        if changed:
            files += 1
            with open(path, "w") as f:
                json.dump(tags, f, separators=(",", ":"))
    print(f"Seeded sizes for {seeded} tags across {files} images "
          f"from {len(sizes)} cached digests.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
