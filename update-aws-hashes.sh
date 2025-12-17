#!/usr/bin/env bash

# Script to update source hashes for aws-* images
set -euo pipefail

IMAGES_DIR="/Users/lucaspick/workspace/drduker/nix-containers/images/images"
SUCCESS_COUNT=0
FAIL_COUNT=0
FAILED_FILES=()

# Get list of files with placeholder hashes
mapfile -t FILES < <(grep -l "sha256-AAAA" "$IMAGES_DIR"/aws-*/default.nix)

echo "Found ${#FILES[@]} files with placeholder hashes"
echo ""

for file in "${FILES[@]}"; do
    echo "==================================================================="
    echo "Processing: $(basename $(dirname "$file"))"
    echo "==================================================================="

    # Extract owner, repo, and version from the file
    owner=$(grep -m1 'owner = "' "$file" | sed 's/.*owner = "\(.*\)";/\1/')
    repo=$(grep -m1 'repo = "' "$file" | sed 's/.*repo = "\(.*\)";/\1/')
    version_line=$(grep -m1 'version = "' "$file" | sed 's/.*version = "\(.*\)";/\1/')

    echo "  Owner: $owner"
    echo "  Repo: $repo"
    echo "  Version: $version_line"

    # Check if version contains variables (like ${...})
    if [[ "$version_line" =~ \$\{ ]]; then
        echo "  WARNING: Version contains variable reference, skipping: $version_line"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_FILES+=("$(basename $(dirname "$file")) - variable version")
        echo ""
        continue
    fi

    version="$version_line"

    # Construct GitHub URL
    url="https://github.com/$owner/$repo/archive/refs/tags/v${version}.tar.gz"
    echo "  URL: $url"

    # Fetch the hash using nix-prefetch-url
    echo "  Fetching hash..."
    # Redirect stderr to /dev/null to ignore warnings, only get stdout
    if ! fetch_output=$(nix-prefetch-url --unpack "$url" 2>/dev/null); then
        echo "  ERROR: Failed to fetch hash (tag may not exist)"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_FILES+=("$(basename $(dirname "$file")) - fetch failed")
        echo ""
        continue
    fi

    # Extract just the hash (last line of output)
    base32_hash=$(echo "$fetch_output" | tail -n 1)
    echo "  Base32 hash: $base32_hash"

    # Convert to SRI format
    echo "  Converting to SRI format..."
    if ! sri_hash=$(nix --extra-experimental-features nix-command hash convert --to sri --hash-algo sha256 "$base32_hash" 2>/dev/null); then
        echo "  ERROR: Failed to convert hash"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_FILES+=("$(basename $(dirname "$file")) - conversion failed")
        echo ""
        continue
    fi

    echo "  SRI hash: $sri_hash"

    # Get the old hash from the file
    old_hash=$(grep -m1 'hash = "sha256-' "$file" | sed 's/.*hash = "\(sha256-[^"]*\)".*/\1/')
    echo "  Old hash: $old_hash"

    # Update the file - replace only the first occurrence (source hash)
    if sed -i.bak "0,/hash = \"sha256-[^\"]*\"/s//hash = \"$sri_hash\"/" "$file"; then
        rm -f "${file}.bak"
        echo "  SUCCESS: Updated hash in $file"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "  ERROR: Failed to update file"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_FILES+=("$(basename $(dirname "$file")) - file update failed")
    fi

    echo ""
done

echo "==================================================================="
echo "SUMMARY"
echo "==================================================================="
echo "Successfully updated: $SUCCESS_COUNT files"
echo "Failed: $FAIL_COUNT files"

if [ $FAIL_COUNT -gt 0 ]; then
    echo ""
    echo "Failed files:"
    for failed in "${FAILED_FILES[@]}"; do
        echo "  - $failed"
    done
fi
