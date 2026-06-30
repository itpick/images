#!/usr/bin/env bash
# Bump an inline-fetch image (images/<name>/default.nix) to a new upstream
# version and repair every content hash it pins.
#
#   scripts/bump-inline-image.sh <image> <new-version>
#
# Strategy (fetcher-agnostic): rewrite `version = "..."`, then iteratively set
# each failing hash to a fake value, build, and read the real hash back out of
# Nix's "got:" mismatch error. This repairs src hashes AND buildGoModule
# vendorHash / cargoHash without per-fetcher special-casing. Builds for
# x86_64-linux. Exits non-zero (and reverts) if it can't converge.
set -uo pipefail

IMG="${1:?usage: bump-inline-image.sh <image> <new-version>}"
NEW="${2:?usage: bump-inline-image.sh <image> <new-version>}"
F="images/${IMG}/default.nix"
SYS="x86_64-linux"
FAKE="sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

[ -f "$F" ] || { echo "$IMG: no $F"; exit 2; }
ORIG=$(cat "$F")
revert() { printf '%s' "$ORIG" > "$F"; }

OLD=$(grep -oE '^[[:space:]]*version = "[^"]+"' "$F" | head -1 | sed -E 's/.*"([^"]+)".*/\1/')
[ -z "$OLD" ] && { echo "$IMG: no version line"; exit 2; }
[ "$OLD" = "$NEW" ] && { echo "$IMG: already $NEW"; exit 0; }

# 1. bump the version
sed -i -E "0,/version = \"$OLD\"/s//version = \"$NEW\"/" "$F"

# 2. iteratively repair hashes (src, then vendorHash, etc.)
for attempt in 1 2 3 4; do
  LOG=$(nix build ".#packages.${SYS}.\"${IMG}\"" --no-link --impure 2>&1)
  if [ $? -eq 0 ]; then
    echo "$IMG: $OLD -> $NEW (built OK)"
    exit 0
  fi
  # Nix reports:  specified: sha256-AAA...   got: sha256-REAL...
  GOT=$(printf '%s' "$LOG" | grep -oE 'got:[[:space:]]+sha256-[A-Za-z0-9+/=]+' | head -1 | grep -oE 'sha256-[A-Za-z0-9+/=]+')
  if [ -n "$GOT" ]; then
    # replace whichever fake/old hash triggered this round
    SPEC=$(printf '%s' "$LOG" | grep -oE 'specified:[[:space:]]+sha256-[A-Za-z0-9+/=]+' | head -1 | grep -oE 'sha256-[A-Za-z0-9+/=]+')
    if [ -n "$SPEC" ] && grep -qF "$SPEC" "$F"; then
      sed -i "s|$SPEC|$GOT|g" "$F"
    else
      # first pass: blank the existing src hash to force a mismatch we can read
      perl -0pi -e "s/(hash|sha256)\\s*=\\s*\"sha256[-:][A-Za-z0-9+\\/=]+\"/\\1 = \"$FAKE\"/" "$F"
    fi
    continue
  fi
  # no hash mismatch in the log -> a real (non-hash) build failure
  echo "$IMG: build failed (not a hash issue):"
  printf '%s\n' "$LOG" | tail -4
  revert; exit 1
done
echo "$IMG: hash repair did not converge"
revert; exit 1
