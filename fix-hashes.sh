#!/usr/bin/env bash
# Script to automatically fix placeholder hashes in nix image definitions
# Usage: ./fix-hashes.sh [image-name] or ./fix-hashes.sh --all

set -e

fix_hash() {
    local img="$1"
    local file="images/$img/default.nix"

    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        return 1
    fi

    # Check if file has placeholder hash
    if ! grep -q "sha256-AAAA" "$file"; then
        echo "[$img] No placeholder hash found"
        return 0
    fi

    echo "[$img] Attempting build to get correct hash..."

    # Try to build and capture error
    output=$(nix build ".#$img" --no-link 2>&1 || true)

    # Extract the correct hash from "got:" line
    got_hash=$(echo "$output" | grep -oP 'got:\s+\K(sha256-[A-Za-z0-9+/]+=*)' | head -1)

    if [ -z "$got_hash" ]; then
        echo "[$img] Could not extract hash from build output"
        return 1
    fi

    echo "[$img] Found hash: $got_hash"

    # Replace the first placeholder hash with the correct one
    sed -i "0,/sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=/{s|sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=|$got_hash|}" "$file"

    echo "[$img] Updated hash in $file"

    # Check if there are more placeholder hashes (vendorHash)
    if grep -q "sha256-AAAA" "$file"; then
        echo "[$img] File has more placeholder hashes, attempting second build..."
        output=$(nix build ".#$img" --no-link 2>&1 || true)
        got_hash=$(echo "$output" | grep -oP 'got:\s+\K(sha256-[A-Za-z0-9+/]+=*)' | head -1)

        if [ -n "$got_hash" ]; then
            sed -i "s|sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=|$got_hash|" "$file"
            echo "[$img] Updated second hash"
        fi
    fi

    return 0
}

if [ "$1" = "--all" ]; then
    # Find all images with placeholder hashes
    images=$(grep -rl "sha256-AAAA" images/*/default.nix | sed 's|images/||;s|/default.nix||' | sort -u)
    total=$(echo "$images" | wc -l)
    count=0

    for img in $images; do
        count=$((count + 1))
        echo ""
        echo "=== [$count/$total] Processing $img ==="
        fix_hash "$img" || true
    done
elif [ -n "$1" ]; then
    fix_hash "$1"
else
    echo "Usage: $0 <image-name> | --all"
    echo ""
    echo "Examples:"
    echo "  $0 argocd           # Fix single image"
    echo "  $0 --all            # Fix all images with placeholder hashes"
fi
