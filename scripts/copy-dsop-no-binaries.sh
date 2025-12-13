#!/usr/bin/env bash
# copy-dsop-no-binaries.sh
# Copy DSOP repos excluding .git directories and binary files
# Logs any binary files found for documentation

set -euo pipefail

SOURCE_DIR="${1:-$HOME/workspace/drduker/data-gathering/dsop}"
DEST_DIR="${2:-/Users/lucaspick/workspace/drduker/nix-containers/images/data-gathering/dsop}"
BINARY_LOG="$DEST_DIR/../dsop-binaries.txt"

echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"
echo "Binary log: $BINARY_LOG"
echo ""

# Create destination
mkdir -p "$DEST_DIR"

# Initialize binary log
echo "# Binary files found in DSOP repos" > "$BINARY_LOG"
echo "# These files were NOT copied to avoid bloating the repository" >> "$BINARY_LOG"
echo "# Generated: $(date)" >> "$BINARY_LOG"
echo "" >> "$BINARY_LOG"

COPIED=0
SKIPPED_BINARY=0
SKIPPED_GIT=0

# Common binary extensions to skip
BINARY_EXTENSIONS="exe|dll|so|dylib|a|o|pyc|pyo|class|jar|war|ear|zip|tar|gz|bz2|xz|7z|rar|iso|img|dmg|pkg|deb|rpm|msi|bin|dat|db|sqlite|sqlite3|pdf|doc|docx|xls|xlsx|ppt|pptx|png|jpg|jpeg|gif|bmp|ico|svg|mp3|mp4|avi|mov|wmv|flv|webm|woff|woff2|ttf|eot|otf"

# Function to check if file is binary
is_binary() {
    local file="$1"

    # Check by extension first (faster)
    if [[ "$file" =~ \.($BINARY_EXTENSIONS)$ ]]; then
        return 0
    fi

    # Check if file command says it's binary (but only for files under 10MB to be fast)
    if [[ -f "$file" ]]; then
        local size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo 0)
        if [[ $size -lt 10485760 ]]; then
            if file "$file" | grep -q "executable\|binary\|data\|archive"; then
                return 0
            fi
        fi
    fi

    return 1
}

echo "Copying files..."

# Use rsync to copy, excluding .git
rsync -av --progress \
    --exclude='.git' \
    --exclude='.git/**' \
    --exclude='*.exe' \
    --exclude='*.dll' \
    --exclude='*.so' \
    --exclude='*.dylib' \
    --exclude='*.a' \
    --exclude='*.o' \
    --exclude='*.pyc' \
    --exclude='*.pyo' \
    --exclude='*.class' \
    --exclude='*.jar' \
    --exclude='*.war' \
    --exclude='*.ear' \
    --exclude='*.zip' \
    --exclude='*.tar' \
    --exclude='*.tar.gz' \
    --exclude='*.tgz' \
    --exclude='*.tar.bz2' \
    --exclude='*.tar.xz' \
    --exclude='*.7z' \
    --exclude='*.rar' \
    --exclude='*.iso' \
    --exclude='*.img' \
    --exclude='*.dmg' \
    --exclude='*.pkg' \
    --exclude='*.deb' \
    --exclude='*.rpm' \
    --exclude='*.msi' \
    --exclude='*.bin' \
    --exclude='*.dat' \
    --exclude='*.db' \
    --exclude='*.sqlite' \
    --exclude='*.sqlite3' \
    --exclude='*.woff' \
    --exclude='*.woff2' \
    --exclude='*.ttf' \
    --exclude='*.eot' \
    --exclude='*.otf' \
    --exclude='node_modules' \
    --exclude='vendor' \
    --exclude='__pycache__' \
    --exclude='.venv' \
    --exclude='venv' \
    "$SOURCE_DIR/" "$DEST_DIR/"

echo ""
echo "Finding and documenting binary files that were excluded..."

# Find all excluded binary files and log them
cd "$SOURCE_DIR"
find . -type f \( \
    -name "*.exe" -o -name "*.dll" -o -name "*.so" -o -name "*.dylib" \
    -o -name "*.a" -o -name "*.o" -o -name "*.jar" -o -name "*.war" \
    -o -name "*.zip" -o -name "*.tar" -o -name "*.tar.gz" -o -name "*.tgz" \
    -o -name "*.7z" -o -name "*.rar" -o -name "*.iso" -o -name "*.img" \
    -o -name "*.dmg" -o -name "*.deb" -o -name "*.rpm" -o -name "*.bin" \
    -o -name "*.woff" -o -name "*.woff2" -o -name "*.ttf" -o -name "*.eot" \
\) -not -path "*/.git/*" | while read -r f; do
    size=$(du -h "$f" | cut -f1)
    echo "$f ($size)" >> "$BINARY_LOG"
    SKIPPED_BINARY=$((SKIPPED_BINARY + 1))
done

echo ""
echo "========================================"
echo "Copy Complete"
echo "========================================"
echo "Destination: $DEST_DIR"
echo "Binary files logged to: $BINARY_LOG"
echo ""
echo "Size comparison:"
echo "  Source (with .git): $(du -sh "$SOURCE_DIR" | cut -f1)"
echo "  Destination (no .git/binaries): $(du -sh "$DEST_DIR" | cut -f1)"
