#!/bin/bash
set -euo pipefail

echo "🔍 Checking for package version changes..."

# Check if there are any package changes first
echo "🔍 Checking if there are any package changes..."
if [ -f package-versions.json ] && [ -f current-versions.json ]; then
    if cmp -s package-versions.json current-versions.json; then
        echo "✅ No package changes detected"
        exit 0
    fi
fi

# Get current package versions using Nix version checker
echo "📋 Getting current package versions..."
nix --extra-experimental-features "nix-command flakes" run .#check-versions | sed 's/🔍 Checking package versions...//' | jq . > current-versions.json

echo "📋 Current versions:"
cat current-versions.json | jq .

# Get list of images for comparison
IMAGES=$(jq -r 'keys[]' current-versions.json)

# Check for previous versions
if [ -f package-versions.json ]; then
    echo "📋 Previous versions:"
    cat package-versions.json | jq .
    
    # Compare versions
    echo "🔍 Comparing versions..."
    CHANGED_IMAGES="[]"
    CHANGES_DETECTED=false
    
    for IMAGE in $IMAGES; do
        CURRENT_VERSION=$(jq -r ".$IMAGE" current-versions.json)
        PREVIOUS_VERSION=$(jq -r ".$IMAGE // \"none\"" package-versions.json)
        
        echo "📦 $IMAGE: $PREVIOUS_VERSION → $CURRENT_VERSION"
        
        if [ "$CURRENT_VERSION" != "$PREVIOUS_VERSION" ]; then
            echo "  ✅ Version changed, needs rebuild"
            CHANGED_IMAGES=$(echo "$CHANGED_IMAGES" | jq ". + [{\"name\": \"$IMAGE\"}]")
            CHANGES_DETECTED=true
        else
            echo "  ⏭️  No change, can skip"
        fi
    done
    
    echo "🎯 Changes detected: $CHANGES_DETECTED"
    echo "📋 Images to rebuild:"
    echo "$CHANGED_IMAGES" | jq .
    
else
    echo "📋 No previous versions file found, will rebuild all images"
    CHANGED_IMAGES=$(echo "$IMAGES" | jq -R . | jq -s 'map({name: .})')
    echo "📋 All images to rebuild:"
    echo "$CHANGED_IMAGES" | jq .
fi

# Save current versions for next run
cp current-versions.json package-versions.json
echo "💾 Saved current versions for next comparison"