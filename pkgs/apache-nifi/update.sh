#!/usr/bin/env bash
# Update script for apache-nifi package
# Usage: ./update.sh [VERSION]
# If VERSION is not provided, fetches the latest stable version

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_NIX="$SCRIPT_DIR/default.nix"

# Get version - either from argument or fetch latest
if [[ $# -ge 1 ]]; then
    VERSION="$1"
else
    echo "Fetching latest NiFi version from Apache..."
    # Get latest version from Apache downloads page
    VERSION=$(curl -sL "https://downloads.apache.org/nifi/" | sed -n 's/.*href="\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\)\/".*/\1/p' | sort -V | tail -1)
    if [[ -z "$VERSION" ]]; then
        echo "Could not determine latest version. Please provide version as argument."
        exit 1
    fi
fi

echo "Updating to NiFi version: $VERSION"

# Fetch SHA512 hash from Apache
HASH_URL="https://downloads.apache.org/nifi/${VERSION}/nifi-${VERSION}-bin.zip.sha512"
echo "Fetching hash from: $HASH_URL"

SHA512_HEX=$(curl -sL "$HASH_URL")
if [[ -z "$SHA512_HEX" ]] || [[ "$SHA512_HEX" == *"Not Found"* ]]; then
    echo "Could not fetch hash from Apache. Check if version $VERSION exists."
    exit 1
fi

# Convert hex SHA512 to base64 SRI format
SHA512_BASE64=$(echo -n "$SHA512_HEX" | xxd -r -p | base64 | tr -d '\n')
SRI_HASH="sha512-${SHA512_BASE64}"

echo "Version: $VERSION"
echo "SHA512 (hex): $SHA512_HEX"
echo "SRI Hash: $SRI_HASH"

# Update default.nix
sed -i.bak \
    -e "s/version = \"[^\"]*\";/version = \"$VERSION\";/" \
    -e "s|hash = \"sha512-[^\"]*\";|hash = \"$SRI_HASH\";|" \
    "$DEFAULT_NIX"

rm -f "$DEFAULT_NIX.bak"

echo "Updated $DEFAULT_NIX"
