#!/usr/bin/env bash
# Fetch detailed data for public Chainguard images only
set -euo pipefail

OUTPUT_DIR="/tmp/chainguard-data"
mkdir -p "$OUTPUT_DIR"

# Known public images from chainguard-images/images GitHub repo
PUBLIC_IMAGES=(
    apko aspnet-runtime bash busybox cosign crane curl dfc dive docker-dind
    dotnet gcc-glibc git glibc-dynamic go gradle grype haproxy helm hugo
    jdk jre k3s ko kubectl laravel malcontent mariadb maven melange
    min-toolkit-debug minio mongodb nginx node openscap opentelemetry-collector-contrib
    php postgres python pytorch redis ruby rust static stunnel tomcat
    valkey wait-for-it wolfi-base wordpress
)

echo "Fetching data for ${#PUBLIC_IMAGES[@]} public Chainguard images..."
echo ""

# Create temp file for images array
> "$OUTPUT_DIR/images_array.json"

for IMAGE in "${PUBLIC_IMAGES[@]}"; do
    echo "Processing $IMAGE..."
    REGISTRY="cgr.dev/chainguard/$IMAGE"

    # Get manifest
    MANIFEST=$(crane manifest "$REGISTRY:latest" 2>/dev/null || echo "")

    if [[ -z "$MANIFEST" ]]; then
        echo "  Warning: Could not fetch manifest for $IMAGE"
        continue
    fi

    # Extract annotations
    TITLE=$(echo "$MANIFEST" | jq -r '.annotations["dev.chainguard.image.title"] // .annotations["org.opencontainers.image.title"] // ""')
    CREATED=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.created"] // ""')
    SOURCE=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.source"] // ""')
    AUTHORS=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.authors"] // ""')
    URL=$(echo "$MANIFEST" | jq -r '.annotations["org.opencontainers.image.url"] // ""')

    # Get architectures
    ARCHS=$(echo "$MANIFEST" | jq -r '[.manifests[]?.platform.architecture] | unique | map(select(. != null)) | join(",")' 2>/dev/null || echo "")

    # Get tags (named tags only, limit to 30)
    TAGS_RAW=$(crane ls "$REGISTRY" 2>/dev/null | grep -v '^sha256-' | head -30)
    TAGS_JSON=$(echo "$TAGS_RAW" | jq -R -s 'split("\n") | map(select(length > 0))')

    # Get SBOM - find most recent .sbom tag
    SBOM_PACKAGES="[]"
    SBOM_TAG=$(crane ls "$REGISTRY" 2>/dev/null | grep '\.sbom$' | tail -1)

    if [[ -n "$SBOM_TAG" ]]; then
        SBOM_MANIFEST=$(crane manifest "$REGISTRY:$SBOM_TAG" 2>/dev/null || echo "")

        if [[ -n "$SBOM_MANIFEST" ]]; then
            SBOM_LAYER=$(echo "$SBOM_MANIFEST" | jq -r '.layers[0].digest // ""')
            if [[ -n "$SBOM_LAYER" && "$SBOM_LAYER" != "null" ]]; then
                SBOM_DATA=$(crane blob "$REGISTRY@$SBOM_LAYER" 2>/dev/null || echo "")
                if [[ -n "$SBOM_DATA" ]]; then
                    # Extract packages (filter out container/source refs)
                    SBOM_PACKAGES=$(echo "$SBOM_DATA" | jq '[.packages[] | select(.name | (startswith("sha256") or startswith("github.com") or startswith("https://")) | not) | {name: .name, version: .versionInfo, license: .licenseDeclared}] | unique_by(.name) | sort_by(.name)' 2>/dev/null || echo "[]")
                fi
            fi
        fi
    fi

    PACKAGE_COUNT=$(echo "$SBOM_PACKAGES" | jq 'length')
    echo "  Found $PACKAGE_COUNT packages, $(echo "$TAGS_JSON" | jq 'length') tags, archs: $ARCHS"

    # Create image JSON
    jq -n \
        --arg name "$IMAGE" \
        --arg registry "$REGISTRY" \
        --arg title "$TITLE" \
        --arg created "$CREATED" \
        --arg source "$SOURCE" \
        --arg authors "$AUTHORS" \
        --arg url "$URL" \
        --arg archs "$ARCHS" \
        --argjson tags "$TAGS_JSON" \
        --argjson packages "$SBOM_PACKAGES" \
        '{
            name: $name,
            registry: $registry,
            public: true,
            metadata: {
                title: $title,
                created: $created,
                source: $source,
                authors: $authors,
                url: $url,
                architectures: ($archs | split(",") | map(select(length > 0)))
            },
            versions: $tags,
            sbom: {
                package_count: ($packages | length),
                packages: $packages
            }
        }' >> "$OUTPUT_DIR/images_array.json"
    echo "" >> "$OUTPUT_DIR/images_array.json"
done

# Combine into final JSON
echo "Creating final JSON..."
jq -s '.' "$OUTPUT_DIR/images_array.json" > "$OUTPUT_DIR/public_images.json"

echo ""
echo "Done! Results saved to $OUTPUT_DIR/public_images.json"
echo "Total public images processed: ${#PUBLIC_IMAGES[@]}"
