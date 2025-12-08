#!/usr/bin/env bash
# Fetch detailed data for Chainguard images
# This script fetches manifest, tags, and SBOM data for each image

set -euo pipefail

OUTPUT_DIR="/tmp/chainguard-data"
mkdir -p "$OUTPUT_DIR"

# Get list of all image names from the JSON
IMAGES_JSON="/Users/lucaspick/workspace/drduker/nix-containers/images/lib/chainguard-images.json"
IMAGES=$(jq -r '.images[].name' "$IMAGES_JSON")

# Counter for progress
TOTAL=$(echo "$IMAGES" | wc -l | tr -d ' ')
CURRENT=0
PUBLIC=0
PRIVATE=0

echo "Fetching data for $TOTAL Chainguard images..."
echo ""

# Create output JSON structure
echo '{"images":[' > "$OUTPUT_DIR/details.json"
FIRST=true

for IMAGE in $IMAGES; do
    CURRENT=$((CURRENT + 1))

    # Skip TEMPLATE
    if [[ "$IMAGE" == "TEMPLATE" ]]; then
        continue
    fi

    REGISTRY="cgr.dev/chainguard/$IMAGE"

    # Try to get manifest
    MANIFEST=$(crane manifest "$REGISTRY:latest" 2>/dev/null || echo "")

    if [[ -z "$MANIFEST" ]]; then
        # Image requires authentication
        PRIVATE=$((PRIVATE + 1))
        echo "[$CURRENT/$TOTAL] $IMAGE - requires auth"

        if [[ "$FIRST" != "true" ]]; then
            echo "," >> "$OUTPUT_DIR/details.json"
        fi
        FIRST=false

        cat >> "$OUTPUT_DIR/details.json" << EOF
{
  "name": "$IMAGE",
  "registry": "$REGISTRY",
  "public": false,
  "requires_auth": true
}
EOF
        continue
    fi

    PUBLIC=$((PUBLIC + 1))
    echo "[$CURRENT/$TOTAL] $IMAGE - fetching details..."

    # Extract annotations from manifest
    TITLE=$(echo "$MANIFEST" | jq -r '.annotations["dev.chainguard.image.title"] // empty')
    CREATED=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.created"] // empty')
    SOURCE=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.source"] // empty')
    AUTHORS=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.authors"] // empty')

    # Get architectures
    ARCHS=$(echo "$MANIFEST" | jq -r '[.manifests[]?.platform.architecture] | unique | join(",")' 2>/dev/null || echo "")

    # Get tags (only named tags, not sha256 refs)
    TAGS=$(crane ls "$REGISTRY" 2>/dev/null | grep -v '^sha256-' | head -20 | tr '\n' ',' | sed 's/,$//')

    # Try to get SBOM for latest
    SBOM_PACKAGES=""
    SBOM_COUNT=0

    # Get manifest digest for SBOM lookup
    DIGEST=$(echo "$MANIFEST" | jq -r '.manifests[0].digest // empty')
    if [[ -n "$DIGEST" ]]; then
        SBOM_TAG="sha256-${DIGEST#sha256:}.sbom"
        SBOM_MANIFEST=$(crane manifest "$REGISTRY:$SBOM_TAG" 2>/dev/null || echo "")

        if [[ -n "$SBOM_MANIFEST" ]]; then
            SBOM_LAYER=$(echo "$SBOM_MANIFEST" | jq -r '.layers[0].digest // empty')
            if [[ -n "$SBOM_LAYER" ]]; then
                SBOM_DATA=$(crane blob "$REGISTRY@$SBOM_LAYER" 2>/dev/null || echo "")
                if [[ -n "$SBOM_DATA" ]]; then
                    # Extract package names and versions
                    SBOM_PACKAGES=$(echo "$SBOM_DATA" | jq -r '[.packages[] | select(.name | startswith("sha256") | not) | select(.name | startswith("github.com") | not) | {name: .name, version: .versionInfo}] | unique_by(.name)' 2>/dev/null || echo "[]")
                    SBOM_COUNT=$(echo "$SBOM_PACKAGES" | jq 'length' 2>/dev/null || echo "0")
                fi
            fi
        fi
    fi

    if [[ "$FIRST" != "true" ]]; then
        echo "," >> "$OUTPUT_DIR/details.json"
    fi
    FIRST=false

    # Write image details
    cat >> "$OUTPUT_DIR/details.json" << EOF
{
  "name": "$IMAGE",
  "registry": "$REGISTRY",
  "public": true,
  "metadata": {
    "title": "$TITLE",
    "created": "$CREATED",
    "source": "$SOURCE",
    "authors": "$AUTHORS",
    "architectures": "$ARCHS"
  },
  "tags": "$(echo $TAGS | sed 's/"/\\"/g')",
  "sbom": {
    "package_count": $SBOM_COUNT,
    "packages": $SBOM_PACKAGES
  }
}
EOF

done

echo ']}' >> "$OUTPUT_DIR/details.json"

echo ""
echo "Done! Results saved to $OUTPUT_DIR/details.json"
echo "Public images: $PUBLIC"
echo "Private images (require auth): $PRIVATE"
