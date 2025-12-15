# Scanning library for grype and syft security scanning
{ pkgs, lib, ... }:

let
  grype = pkgs.grype;
  syft = pkgs.syft;

in {
  # Script to scan an image from CLI
  scanImageScript = pkgs.writeShellScriptBin "scan-image" ''
    set -euo pipefail

    IMAGE_NAME="''${1:-}"
    OUTPUT_DIR="''${2:-./scan-results}"

    if [[ -z "$IMAGE_NAME" ]]; then
      echo "Usage: scan-image <image-name> [output-dir]"
      echo ""
      echo "Examples:"
      echo "  scan-image alertmanager"
      echo "  scan-image prometheus ./my-scans"
      exit 1
    fi

    mkdir -p "$OUTPUT_DIR/$IMAGE_NAME"

    SCAN_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    SCAN_TIME_DISPLAY=$(TZ="America/Chicago" date +"%b %d, %Y, %I:%M:%S %p (GMT%z)")

    echo "Building image $IMAGE_NAME..."
    IMAGE_PATH=$(nix build ".#$IMAGE_NAME" --no-link --print-out-paths 2>/dev/null)

    if [[ -z "$IMAGE_PATH" ]]; then
      echo "Error: Failed to build $IMAGE_NAME"
      exit 1
    fi

    echo "Image built: $IMAGE_PATH"
    echo "Exporting to OCI format..."

    # Get skopeo with nix: transport
    SKOPEO_PATH=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>/dev/null | grep -v man | head -1)
    SKOPEO="$SKOPEO_PATH/bin/skopeo"

    mkdir -p /tmp/oci-$IMAGE_NAME
    $SKOPEO copy --insecure-policy \
      "nix:$IMAGE_PATH" \
      "oci:/tmp/oci-$IMAGE_NAME:$IMAGE_NAME:latest" 2>/dev/null || {
        echo "Warning: Failed to export to OCI, trying direct scan..."
      }

    echo "Generating SBOM with syft..."
    ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/$IMAGE_NAME/sbom.json" 2>/dev/null || echo '{"artifacts":[]}' > "$OUTPUT_DIR/$IMAGE_NAME/sbom.json"
    ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o cyclonedx-json > "$OUTPUT_DIR/$IMAGE_NAME/sbom-cyclonedx.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/$IMAGE_NAME/sbom-cyclonedx.json"
    ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o spdx-json > "$OUTPUT_DIR/$IMAGE_NAME/sbom-spdx.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/$IMAGE_NAME/sbom-spdx.json"
    ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/$IMAGE_NAME/sbom.txt" 2>/dev/null || echo "No packages found" > "$OUTPUT_DIR/$IMAGE_NAME/sbom.txt"

    echo "Scanning for vulnerabilities with grype..."
    ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo '{"matches":[]}' > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json"
    ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.txt" 2>/dev/null || echo "No vulnerabilities found" > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.txt"

    # Count vulnerabilities
    CRITICAL=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Critical")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
    HIGH=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "High")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
    MEDIUM=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Medium")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
    LOW=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Low")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
    TOTAL=$(${pkgs.jq}/bin/jq '.matches | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
    PKG_COUNT=$(${pkgs.jq}/bin/jq '.artifacts | length' "$OUTPUT_DIR/$IMAGE_NAME/sbom.json" 2>/dev/null || echo "0")

    # Create summary
    cat > "$OUTPUT_DIR/$IMAGE_NAME/scan-summary.json" << EOF
{
  "imageName": "$IMAGE_NAME",
  "scanTime": "$SCAN_TIME",
  "scanTimeDisplay": "$SCAN_TIME_DISPLAY",
  "packages": $PKG_COUNT,
  "vulnerabilities": {
    "total": $TOTAL,
    "critical": $CRITICAL,
    "high": $HIGH,
    "medium": $MEDIUM,
    "low": $LOW
  }
}
EOF

    # Create human-readable summary
    cat > "$OUTPUT_DIR/$IMAGE_NAME/SCAN-SUMMARY.md" << EOF
# Security Scan: $IMAGE_NAME

**Last Scanned:** $SCAN_TIME_DISPLAY

## Vulnerability Summary

| Severity | Count |
|----------|-------|
| Critical | $CRITICAL |
| High     | $HIGH |
| Medium   | $MEDIUM |
| Low      | $LOW |
| **Total** | **$TOTAL** |

## Package Count

Total packages: $PKG_COUNT

## Files

- \`sbom.json\` - SBOM in Syft JSON format
- \`sbom-cyclonedx.json\` - SBOM in CycloneDX format
- \`sbom-spdx.json\` - SBOM in SPDX format
- \`sbom.txt\` - Human-readable package list
- \`vulnerabilities.json\` - Grype vulnerability scan (JSON)
- \`vulnerabilities.txt\` - Human-readable vulnerability list
EOF

    # Create archive
    tar -czvf "$OUTPUT_DIR/$IMAGE_NAME-scan-results.tar.gz" -C "$OUTPUT_DIR/$IMAGE_NAME" .

    echo ""
    echo "Scan complete for $IMAGE_NAME"
    echo "  Packages: $PKG_COUNT"
    echo "  Vulnerabilities: Critical=$CRITICAL High=$HIGH Medium=$MEDIUM Low=$LOW (Total=$TOTAL)"
    echo ""
    echo "Results saved to: $OUTPUT_DIR/$IMAGE_NAME/"
    echo "Archive: $OUTPUT_DIR/$IMAGE_NAME-scan-results.tar.gz"

    # Cleanup
    rm -rf "/tmp/oci-$IMAGE_NAME"
  '';

  # Script to scan all BigBang images
  scanAllBigbangScript = pkgs.writeShellScriptBin "scan-all-bigbang" ''
    set -euo pipefail

    OUTPUT_DIR="''${1:-./bigbang-scan-results}"
    BIGBANG_LIST="./bundler/bigbang.txt"

    if [[ ! -f "$BIGBANG_LIST" ]]; then
      echo "Error: BigBang list not found: $BIGBANG_LIST"
      exit 1
    fi

    mkdir -p "$OUTPUT_DIR"

    # Get skopeo with nix: transport once
    echo "Getting skopeo with nix: transport..."
    SKOPEO_PATH=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>/dev/null | grep -v man | head -1)
    SKOPEO="$SKOPEO_PATH/bin/skopeo"

    TOTAL=0
    SUCCESS=0
    FAILED=""

    while read -r IMAGE_NAME; do
      [[ -z "$IMAGE_NAME" || "$IMAGE_NAME" =~ ^# ]] && continue
      TOTAL=$((TOTAL + 1))

      echo ""
      echo "[$TOTAL] Scanning: $IMAGE_NAME"

      mkdir -p "$OUTPUT_DIR/$IMAGE_NAME"

      SCAN_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
      SCAN_TIME_DISPLAY=$(TZ="America/Chicago" date +"%b %d, %Y, %I:%M:%S %p (GMT%z)")

      # Build image
      IMAGE_PATH=$(nix build ".#$IMAGE_NAME" --no-link --print-out-paths 2>/dev/null) || {
        echo "  Failed to build $IMAGE_NAME"
        FAILED="$FAILED $IMAGE_NAME"
        continue
      }

      # Export to OCI
      mkdir -p /tmp/oci-$IMAGE_NAME
      $SKOPEO copy --insecure-policy \
        "nix:$IMAGE_PATH" \
        "oci:/tmp/oci-$IMAGE_NAME:$IMAGE_NAME:latest" 2>/dev/null || {
          echo "  Failed to export $IMAGE_NAME"
          FAILED="$FAILED $IMAGE_NAME"
          rm -rf /tmp/oci-$IMAGE_NAME
          continue
        }

      # Scan with syft
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/$IMAGE_NAME/sbom.json" 2>/dev/null || echo '{"artifacts":[]}' > "$OUTPUT_DIR/$IMAGE_NAME/sbom.json"
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o cyclonedx-json > "$OUTPUT_DIR/$IMAGE_NAME/sbom-cyclonedx.json" 2>/dev/null || true
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/$IMAGE_NAME/sbom.txt" 2>/dev/null || true

      # Scan with grype
      ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo '{"matches":[]}' > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json"
      ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.txt" 2>/dev/null || true

      # Count vulnerabilities
      CRITICAL=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Critical")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
      HIGH=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "High")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
      MEDIUM=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Medium")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
      LOW=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Low")] | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
      VULN_TOTAL=$(${pkgs.jq}/bin/jq '.matches | length' "$OUTPUT_DIR/$IMAGE_NAME/vulnerabilities.json" 2>/dev/null || echo "0")
      PKG_COUNT=$(${pkgs.jq}/bin/jq '.artifacts | length' "$OUTPUT_DIR/$IMAGE_NAME/sbom.json" 2>/dev/null || echo "0")

      # Create summary
      cat > "$OUTPUT_DIR/$IMAGE_NAME/scan-summary.json" << EOF
{
  "imageName": "$IMAGE_NAME",
  "scanTime": "$SCAN_TIME",
  "scanTimeDisplay": "$SCAN_TIME_DISPLAY",
  "packages": $PKG_COUNT,
  "vulnerabilities": {
    "total": $VULN_TOTAL,
    "critical": $CRITICAL,
    "high": $HIGH,
    "medium": $MEDIUM,
    "low": $LOW
  }
}
EOF

      # Create archive
      tar -czvf "$OUTPUT_DIR/$IMAGE_NAME-scan-results.tar.gz" -C "$OUTPUT_DIR/$IMAGE_NAME" . 2>/dev/null

      echo "  Packages: $PKG_COUNT, Vulns: C=$CRITICAL H=$HIGH M=$MEDIUM L=$LOW"
      SUCCESS=$((SUCCESS + 1))

      # Cleanup
      rm -rf /tmp/oci-$IMAGE_NAME
    done < "$BIGBANG_LIST"

    echo ""
    echo "========================================"
    echo "Scan complete: $SUCCESS/$TOTAL images scanned"
    if [[ -n "$FAILED" ]]; then
      echo "Failed:$FAILED"
    fi
    echo "Results in: $OUTPUT_DIR"

    # Create combined summary
    echo "Creating combined summary..."
    cat > "$OUTPUT_DIR/SUMMARY.md" << EOF
# BigBang Security Scan Summary

**Scan Date:** $(TZ="America/Chicago" date +"%b %d, %Y, %I:%M:%S %p (GMT%z)")
**Images Scanned:** $SUCCESS / $TOTAL

## Per-Image Results

| Image | Critical | High | Medium | Low |
|-------|----------|------|--------|-----|
EOF

    for summary in "$OUTPUT_DIR"/*/scan-summary.json; do
      if [[ -f "$summary" ]]; then
        NAME=$(${pkgs.jq}/bin/jq -r '.imageName' "$summary")
        CRITICAL=$(${pkgs.jq}/bin/jq -r '.vulnerabilities.critical' "$summary")
        HIGH=$(${pkgs.jq}/bin/jq -r '.vulnerabilities.high' "$summary")
        MEDIUM=$(${pkgs.jq}/bin/jq -r '.vulnerabilities.medium' "$summary")
        LOW=$(${pkgs.jq}/bin/jq -r '.vulnerabilities.low' "$summary")
        echo "| $NAME | $CRITICAL | $HIGH | $MEDIUM | $LOW |" >> "$OUTPUT_DIR/SUMMARY.md"
      fi
    done

    echo ""
    echo "Summary written to: $OUTPUT_DIR/SUMMARY.md"
  '';

  # Script to scan ALL discovered images and output to each image's folder
  scanAllToFoldersScript = pkgs.writeShellScriptBin "scan-all" ''
    set -euo pipefail

    IMAGES_DIR="./images"

    if [[ ! -d "$IMAGES_DIR" ]]; then
      echo "Error: Images directory not found: $IMAGES_DIR"
      exit 1
    fi

    # Get skopeo with nix: transport once
    echo "Getting skopeo with nix: transport..."
    SKOPEO_PATH=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>/dev/null | grep -v man | head -1)
    SKOPEO="$SKOPEO_PATH/bin/skopeo"

    # Get list of all images
    IMAGES=$(ls -d "$IMAGES_DIR"/*/ 2>/dev/null | xargs -I{} basename {} | sort)
    TOTAL=$(echo "$IMAGES" | wc -l | tr -d ' ')

    echo "Found $TOTAL images to scan"
    echo ""

    SUCCESS=0
    FAILED=""
    COUNT=0

    for IMAGE_NAME in $IMAGES; do
      COUNT=$((COUNT + 1))

      # Skip if no default.nix
      if [[ ! -f "$IMAGES_DIR/$IMAGE_NAME/default.nix" ]]; then
        echo "[$COUNT/$TOTAL] Skipping $IMAGE_NAME (no default.nix)"
        continue
      fi

      echo "[$COUNT/$TOTAL] Scanning: $IMAGE_NAME"

      OUTPUT_DIR="$IMAGES_DIR/$IMAGE_NAME/scan"
      mkdir -p "$OUTPUT_DIR"

      SCAN_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
      SCAN_TIME_DISPLAY=$(TZ="America/Chicago" date +"%b %d, %Y, %I:%M:%S %p (GMT%z)")

      # Build image
      IMAGE_PATH=$(nix build ".#$IMAGE_NAME" --no-link --print-out-paths 2>/dev/null) || {
        echo "  Failed to build $IMAGE_NAME"
        FAILED="$FAILED $IMAGE_NAME"
        continue
      }

      # Export to OCI
      rm -rf /tmp/oci-$IMAGE_NAME
      mkdir -p /tmp/oci-$IMAGE_NAME
      $SKOPEO copy --insecure-policy \
        "nix:$IMAGE_PATH" \
        "oci:/tmp/oci-$IMAGE_NAME:$IMAGE_NAME:latest" 2>/dev/null || {
          echo "  Failed to export $IMAGE_NAME"
          FAILED="$FAILED $IMAGE_NAME"
          rm -rf /tmp/oci-$IMAGE_NAME
          continue
        }

      # Scan with syft
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/sbom.json" 2>/dev/null || echo '{"artifacts":[]}' > "$OUTPUT_DIR/sbom.json"
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o cyclonedx-json > "$OUTPUT_DIR/sbom-cyclonedx.json" 2>/dev/null || true
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o spdx-json > "$OUTPUT_DIR/sbom-spdx.json" 2>/dev/null || true
      ${syft}/bin/syft "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/sbom.txt" 2>/dev/null || true

      # Scan with grype
      ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o json > "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo '{"matches":[]}' > "$OUTPUT_DIR/vulnerabilities.json"
      ${grype}/bin/grype "oci-dir:/tmp/oci-$IMAGE_NAME" -o table > "$OUTPUT_DIR/vulnerabilities.txt" 2>/dev/null || true

      # Count vulnerabilities
      CRITICAL=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Critical")] | length' "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo "0")
      HIGH=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "High")] | length' "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo "0")
      MEDIUM=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Medium")] | length' "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo "0")
      LOW=$(${pkgs.jq}/bin/jq '[.matches[] | select(.vulnerability.severity == "Low")] | length' "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo "0")
      VULN_TOTAL=$(${pkgs.jq}/bin/jq '.matches | length' "$OUTPUT_DIR/vulnerabilities.json" 2>/dev/null || echo "0")
      PKG_COUNT=$(${pkgs.jq}/bin/jq '.artifacts | length' "$OUTPUT_DIR/sbom.json" 2>/dev/null || echo "0")

      # Create summary JSON
      cat > "$OUTPUT_DIR/scan-summary.json" << EOF
{
  "imageName": "$IMAGE_NAME",
  "scanTime": "$SCAN_TIME",
  "scanTimeDisplay": "$SCAN_TIME_DISPLAY",
  "packages": $PKG_COUNT,
  "vulnerabilities": {
    "total": $VULN_TOTAL,
    "critical": $CRITICAL,
    "high": $HIGH,
    "medium": $MEDIUM,
    "low": $LOW
  }
}
EOF

      # Create README with scan info
      cat > "$OUTPUT_DIR/README.md" << EOF
# Security Scan: $IMAGE_NAME

**Image Updated:** See image build time
**Last Scanned:** $SCAN_TIME_DISPLAY

## Vulnerability Summary

| Severity | Count |
|----------|-------|
| Critical | $CRITICAL |
| High     | $HIGH |
| Medium   | $MEDIUM |
| Low      | $LOW |
| **Total** | **$VULN_TOTAL** |

## Package Count

Total packages: $PKG_COUNT

## Files

- \`sbom.json\` - SBOM in Syft JSON format
- \`sbom-cyclonedx.json\` - SBOM in CycloneDX format
- \`sbom-spdx.json\` - SBOM in SPDX format
- \`sbom.txt\` - Human-readable package list
- \`vulnerabilities.json\` - Grype vulnerability scan (JSON)
- \`vulnerabilities.txt\` - Human-readable vulnerability list
EOF

      # Create compressed archive
      tar -czvf "$OUTPUT_DIR/$IMAGE_NAME-scan-results.tar.gz" -C "$OUTPUT_DIR" \
        sbom.json sbom-cyclonedx.json sbom-spdx.json sbom.txt \
        vulnerabilities.json vulnerabilities.txt scan-summary.json README.md 2>/dev/null || true

      echo "  Packages: $PKG_COUNT, Vulns: C=$CRITICAL H=$HIGH M=$MEDIUM L=$LOW"
      SUCCESS=$((SUCCESS + 1))

      # Cleanup
      rm -rf /tmp/oci-$IMAGE_NAME
    done

    echo ""
    echo "========================================"
    echo "Scan complete: $SUCCESS images scanned"
    if [[ -n "$FAILED" ]]; then
      echo "Failed:$FAILED"
    fi
    echo ""
    echo "Results saved to: images/<image-name>/scan/"
  '';

  # Generate README with scan metadata for an image
  generateScanReadme = { imageName, buildType ? "source", imageVersion ? "latest", buildTime ? null }:
    let
      buildTimeStr = if buildTime != null then buildTime else "Unknown";
    in pkgs.writeText "${imageName}-README.md" ''
      # ${imageName}

      ## Image Metadata

      | Field | Value |
      |-------|-------|
      | **Version** | ${imageVersion} |
      | **Build Type** | ${buildType} |
      | **Image Updated** | ${buildTimeStr} |
      | **Last Scanned** | See scan-summary.json |

      ## Security Scan

      This image has been scanned for vulnerabilities using:
      - **Grype** - Vulnerability scanner
      - **Syft** - SBOM generator

      ### Scan Results

      See the following files in the \`scan-results/\` directory:
      - \`scan-summary.json\` - Summary with vulnerability counts
      - \`sbom.json\` - Full Software Bill of Materials
      - \`vulnerabilities.json\` - Detailed vulnerability report

      ## Build Information

      - **Build Type**: ${buildType}
        - \`source\`: Built from source code using Nix
        - \`binary\`: Pre-built binary packaged with Nix

      ## Usage

      ```bash
      # Pull the image
      docker pull ghcr.io/nix-containers/${imageName}:${imageVersion}

      # Run the image
      docker run --rm ghcr.io/nix-containers/${imageName}:${imageVersion}
      ```
    '';
}
