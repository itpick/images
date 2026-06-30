#!/usr/bin/env bash
# Regenerate website/nixpkgs-meta.json: curated nixpkgs metadata
# (meta.description / longDescription / homepage) for every image packaged
# directly from nixpkgs (drv = pkgs.<attr>).
#
# This is done OFFLINE and committed as JSON so the website build stays pure —
# generate-site.nix must never evaluate pkgs.<attr> at build time (broken attrs
# such as `spire-agent = spire.agent` throw uncaught errors and fail the build).
#
# Usage: scripts/gen-nixpkgs-meta.sh   (run from the repo root)
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Mapping images -> nixpkgs attr (drv = pkgs.<attr>)..." >&2
map=$(grep -rEh 'drv = pkgs\.[a-zA-Z0-9_-]+' images/*/default.nix /dev/null 2>/dev/null || true)
# Build image -> attr pairs, skipping stdenv/fetchurl wrappers.
pairs=$(for f in images/*/default.nix; do
  name=$(basename "$(dirname "$f")")
  attr=$(grep -oE 'drv = pkgs\.[a-zA-Z0-9_-]+' "$f" 2>/dev/null | head -1 | sed 's/drv = pkgs\.//')
  [ -z "$attr" ] && continue
  case "$attr" in stdenv|fetchurl) continue;; esac
  printf '%s\t%s\n' "$name" "$attr"
done | sort -u)

echo "$pairs" | awk -F'\t' '
  BEGIN {
    print "let p = import <nixpkgs> { config.allowUnfree = true; config.allowBroken = true; };"
    print "  s = x: if builtins.isString x then x else \"\";"
    print "  g = a: let r = builtins.tryEval (let pkg = p.${a} or null; in if pkg == null then {} else {"
    print "    description = s (pkg.meta.description or \"\");"
    print "    longDescription = s (pkg.meta.longDescription or \"\");"
    print "    homepage = s (pkg.meta.homepage or \"\");"
    print "  }); in if r.success then r.value else {};"
    print "in builtins.listToAttrs ["
  }
  { printf "  { name = \"%s\"; value = g \"%s\"; }\n", $1, $2 }
  END { print "]" }
' > /tmp/nixpkgs-meta-expr.nix

echo "Evaluating nixpkgs metadata (tryEval-safe)..." >&2
nix eval --impure --json -f /tmp/nixpkgs-meta-expr.nix > website/nixpkgs-meta.json
echo "Wrote website/nixpkgs-meta.json ($(wc -c < website/nixpkgs-meta.json) bytes)" >&2
