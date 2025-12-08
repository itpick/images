# Chart Tools
# ============
# Tools for managing Helm charts: pulling, version checking, and image extraction.
#
# Usage in flake.nix:
#   let chartTools = import ./lib/chart-tools.nix { inherit pkgs; chartDefs = import ./charts.nix; };
#   in chartTools
#
# Commands:
#   nix run .#chart-pull         -- Pull all charts to ./charts directory
#   nix run .#chart-pull-oci     -- Pull only OCI charts
#   nix run .#chart-check-versions -- Check for newer chart versions
#   nix run .#chart-extract-images -- Extract all container images from charts
#   nix run .#chart-report       -- Generate comprehensive chart report

{ pkgs, chartDefs }:

let
  inherit (pkgs) lib;

  # Flatten chart definitions into a list
  allCharts = lib.flatten (lib.mapAttrsToList (category: charts:
    lib.mapAttrsToList (name: chart:
      chart // { inherit name category; }
    ) charts
  ) chartDefs);

  # Separate OCI and traditional Helm repo charts
  ociCharts = builtins.filter (c: lib.hasPrefix "oci://" c.url) allCharts;
  repoCharts = builtins.filter (c: !(lib.hasPrefix "oci://" c.url)) allCharts;

in {
  # Pull all charts to a local directory
  chart-pull = pkgs.writeShellScriptBin "chart-pull" ''
    set -euo pipefail

    CHART_DIR="''${1:-./charts}"
    mkdir -p "$CHART_DIR"

    echo "=== Pulling All Helm Charts ==="
    echo "Output directory: $CHART_DIR"
    echo ""

    TOTAL=0
    SUCCESS=0
    FAILED=""

    # OCI Charts
    echo "--- OCI Charts ---"
    ${lib.concatStringsSep "\n" (map (chart: ''
      TOTAL=$((TOTAL + 1))
      echo "Pulling ${chart.name} (${chart.category})..."
      if ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url} --version ${chart.version} -d "$CHART_DIR" 2>/dev/null; then
        echo "  OK: ${chart.name}:${chart.version}"
        SUCCESS=$((SUCCESS + 1))
      else
        echo "  FAILED: ${chart.name}"
        FAILED="$FAILED ${chart.name}"
      fi
    '') ociCharts)}

    # Repository Charts
    echo ""
    echo "--- Repository Charts ---"
    ${lib.concatStringsSep "\n" (map (chart: ''
      TOTAL=$((TOTAL + 1))
      echo "Pulling ${chart.name} (${chart.category})..."
      if ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" 2>/dev/null; then
        echo "  OK: ${chart.name}:${chart.version}"
        SUCCESS=$((SUCCESS + 1))
      else
        echo "  FAILED: ${chart.name}"
        FAILED="$FAILED ${chart.name}"
      fi
    '') repoCharts)}

    echo ""
    echo "=== Summary ==="
    echo "Total: $TOTAL"
    echo "Success: $SUCCESS"
    echo "Failed: $((TOTAL - SUCCESS))"
    if [ -n "$FAILED" ]; then
      echo "Failed charts:$FAILED"
    fi

    echo ""
    echo "Charts saved to: $CHART_DIR"
    ls -la "$CHART_DIR"/*.tgz 2>/dev/null || echo "No charts found"
  '';

  # Check for newer versions of all charts
  chart-check-versions = pkgs.writeShellScriptBin "chart-check-versions" ''
    set -euo pipefail

    echo "=== Checking Chart Versions ==="
    echo ""

    UPDATES=""

    # Function to compare versions
    check_update() {
      local name="$1"
      local current="$2"
      local latest="$3"

      if [ "$current" != "$latest" ] && [ -n "$latest" ]; then
        echo "  UPDATE AVAILABLE: $current -> $latest"
        UPDATES="$UPDATES\n  $name: $current -> $latest"
      else
        echo "  Current: $current (up to date)"
      fi
    }

    echo "--- OCI Charts ---"
    ${lib.concatStringsSep "\n" (map (chart: ''
      echo ""
      echo "${chart.name} (${chart.category}):"
      echo "  URL: ${chart.url}"
      LATEST=$(${pkgs.kubernetes-helm}/bin/helm show chart ${chart.url} 2>/dev/null | ${pkgs.gnugrep}/bin/grep "^version:" | ${pkgs.gawk}/bin/awk '{print $2}' || echo "")
      check_update "${chart.name}" "${chart.version}" "$LATEST"
    '') ociCharts)}

    echo ""
    echo "--- Repository Charts ---"
    ${lib.concatStringsSep "\n" (map (chart: ''
      echo ""
      echo "${chart.name} (${chart.category}):"
      echo "  URL: ${chart.url}"
      # Add repo temporarily to check versions
      REPO_NAME="temp-${chart.name}-$$"
      ${pkgs.kubernetes-helm}/bin/helm repo add "$REPO_NAME" ${chart.url} >/dev/null 2>&1 || true
      ${pkgs.kubernetes-helm}/bin/helm repo update "$REPO_NAME" >/dev/null 2>&1 || true
      LATEST=$(${pkgs.kubernetes-helm}/bin/helm search repo "$REPO_NAME/${chart.chart}" --output json 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[0].version // empty' || echo "")
      ${pkgs.kubernetes-helm}/bin/helm repo remove "$REPO_NAME" >/dev/null 2>&1 || true
      check_update "${chart.name}" "${chart.version}" "$LATEST"
    '') repoCharts)}

    echo ""
    echo "=== Summary ==="
    if [ -n "$UPDATES" ]; then
      echo "Charts with available updates:"
      echo -e "$UPDATES"
    else
      echo "All charts are up to date!"
    fi
  '';

  # Extract all container images from pulled charts
  # Uses multiple strategies: values.yaml parsing, helm template, and pattern matching
  chart-extract-images = pkgs.writeShellScriptBin "chart-extract-images" ''
    set -euo pipefail

    CHART_DIR="''${1:-./charts}"
    OUTPUT_FILE="''${2:-chart-images.json}"

    if [ ! -d "$CHART_DIR" ]; then
      echo "Error: Chart directory '$CHART_DIR' does not exist."
      echo "Run 'nix run .#chart-pull' first to download charts."
      exit 1
    fi

    echo "=== Extracting Container Images from Charts ==="
    echo "Chart directory: $CHART_DIR"
    echo "Output file: $OUTPUT_FILE"
    echo ""

    TEMP_DIR=$(mktemp -d)
    trap "rm -rf $TEMP_DIR" EXIT

    ALL_IMAGES=""
    CHART_IMAGES_JSON="[]"

    for CHART_TGZ in "$CHART_DIR"/*.tgz; do
      [ -f "$CHART_TGZ" ] || continue

      CHART_FILE=$(basename "$CHART_TGZ")
      # Extract chart name - handle versions like "1.2.3", "v1.2.3", etc.
      CHART_NAME=$(echo "$CHART_FILE" | ${pkgs.gnused}/bin/sed -E 's/-[v]?[0-9]+\.[0-9]+.*\.tgz$//')
      echo "Processing: $CHART_NAME ($CHART_FILE)"

      # Extract chart to temp directory
      EXTRACT_DIR="$TEMP_DIR/$CHART_NAME"
      mkdir -p "$EXTRACT_DIR"
      ${pkgs.gnutar}/bin/tar -xzf "$CHART_TGZ" -C "$EXTRACT_DIR" 2>/dev/null || continue

      # Strategy 1: Parse values.yaml for image configurations
      # Look for common patterns: image.repository/tag, images.*.repository/tag
      VALUES_IMAGES=""
      for VALUES_FILE in $(find "$EXTRACT_DIR" -name "values.yaml" -o -name "values.yml" 2>/dev/null); do
        # Extract repository:tag patterns from image configurations
        PARSED=$(${pkgs.yq}/bin/yq -r '
          .. | objects |
          select(has("repository")) |
          if has("tag") then "\(.repository):\(.tag)"
          elif has("image") and (.image | type == "string") then .image
          else "\(.repository):latest"
          end
        ' "$VALUES_FILE" 2>/dev/null | ${pkgs.gnugrep}/bin/grep -v '^null' | ${pkgs.gnugrep}/bin/grep -v '^:' | sort -u || true)
        VALUES_IMAGES="$VALUES_IMAGES
$PARSED"

        # Also look for direct image: "registry/repo:tag" patterns
        DIRECT_IMAGES=$(${pkgs.yq}/bin/yq -r '
          .. | select(type == "!!str") | select(test("^[a-z0-9.-]+(/[a-z0-9._-]+)+:[a-z0-9._-]+$"))
        ' "$VALUES_FILE" 2>/dev/null | sort -u || true)
        VALUES_IMAGES="$VALUES_IMAGES
$DIRECT_IMAGES"
      done

      # Strategy 2: Use helm template to render and extract images
      RENDERED_IMAGES=$(${pkgs.kubernetes-helm}/bin/helm template "$CHART_NAME" "$CHART_TGZ" --include-crds 2>/dev/null | \
        ${pkgs.gnugrep}/bin/grep -E '^\s*image:\s*' 2>/dev/null | \
        ${pkgs.gnused}/bin/sed 's/.*image:\s*//' | \
        ${pkgs.gnused}/bin/sed "s/[\"']//g" | \
        ${pkgs.gnugrep}/bin/grep -v '{{' | \
        sort -u || true)

      # Strategy 3: Grep for image references in all yaml files
      GREP_IMAGES=$(find "$EXTRACT_DIR" -type f \( -name "*.yaml" -o -name "*.yml" \) -exec cat {} \; 2>/dev/null | \
        ${pkgs.gnugrep}/bin/grep -oE '[a-z0-9.-]+\.[a-z]+/[a-z0-9/_.-]+:[a-z0-9._-]+' 2>/dev/null | \
        ${pkgs.gnugrep}/bin/grep -v '{{' | \
        sort -u || true)

      # Combine all found images and clean up
      CHART_FOUND_IMAGES=$(printf "%s\n%s\n%s" "$VALUES_IMAGES" "$RENDERED_IMAGES" "$GREP_IMAGES" | \
        ${pkgs.gnugrep}/bin/grep -v '^\s*$' | \
        ${pkgs.gnugrep}/bin/grep -v '^null' | \
        ${pkgs.gnugrep}/bin/grep ':' | \
        sort -u || true)

      if [ -n "$CHART_FOUND_IMAGES" ]; then
        IMAGE_COUNT=$(echo "$CHART_FOUND_IMAGES" | wc -l | tr -d ' ')
        echo "  Found $IMAGE_COUNT images:"
        echo "$CHART_FOUND_IMAGES" | while read -r img; do
          [ -n "$img" ] && echo "    - $img"
        done

        # Add to chart-specific JSON
        CHART_JSON=$(echo "$CHART_FOUND_IMAGES" | ${pkgs.jq}/bin/jq -R -s --arg chart "$CHART_NAME" '
          split("\n") | map(select(length > 0)) | {chart: $chart, images: .}
        ')
        CHART_IMAGES_JSON=$(echo "$CHART_IMAGES_JSON" | ${pkgs.jq}/bin/jq --argjson new "$CHART_JSON" '. + [$new]')

        ALL_IMAGES="$ALL_IMAGES
$CHART_FOUND_IMAGES"
      else
        echo "  No images found (may need custom values)"
      fi
      echo ""
    done

    # Generate JSON output with detailed breakdown
    echo "Generating $OUTPUT_FILE..."

    # Deduplicate and format final output
    UNIQUE_IMAGES=$(echo "$ALL_IMAGES" | sort -u | ${pkgs.gnugrep}/bin/grep -v '^\s*$' || true)

    # Create comprehensive JSON output
    echo "$UNIQUE_IMAGES" | ${pkgs.jq}/bin/jq -R -s --argjson by_chart "$CHART_IMAGES_JSON" '
      split("\n") | map(select(length > 0)) |
      {
        generated: (now | todate),
        total_unique_images: length,
        by_chart: $by_chart,
        images: (. | map({
          full: .,
          registry: (
            if (. | startswith("docker.io/")) then "docker.io"
            elif (. | contains("/")) then (split("/")[0])
            else "docker.io"
            end
          ),
          repository: (
            if (. | contains(":")) then (. | split(":")[0])
            else .
            end
          ),
          tag: (
            if (. | contains(":")) then (. | split(":")[-1])
            else "latest"
            end
          )
        }))
      }
    ' > "$OUTPUT_FILE"

    echo ""
    echo "=== Summary ==="
    ${pkgs.jq}/bin/jq -r '.total_unique_images as $total | "Total unique images: \($total)"' "$OUTPUT_FILE"
    echo ""
    echo "Images by registry:"
    ${pkgs.jq}/bin/jq -r '.images | group_by(.registry) | map({registry: .[0].registry, count: length}) | sort_by(-.count) | .[] | "  \(.registry): \(.count)"' "$OUTPUT_FILE"
    echo ""
    echo "Images per chart:"
    ${pkgs.jq}/bin/jq -r '.by_chart[] | "  \(.chart): \(.images | length)"' "$OUTPUT_FILE"

    echo ""
    echo "Output saved to: $OUTPUT_FILE"
  '';

  # Generate a comprehensive chart report
  chart-report = pkgs.writeShellScriptBin "chart-report" ''
    set -euo pipefail

    OUTPUT_FILE="''${1:-chart-report.md}"

    echo "=== Generating Chart Report ==="

    cat > "$OUTPUT_FILE" << 'HEADER'
# Helm Chart Report

Generated: $(date -Iseconds)

## Chart Inventory

HEADER

    # Add charts by category
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (category: charts: ''
      echo "" >> "$OUTPUT_FILE"
      echo "### ${category}" >> "$OUTPUT_FILE"
      echo "" >> "$OUTPUT_FILE"
      echo "| Chart | Version | Description |" >> "$OUTPUT_FILE"
      echo "|-------|---------|-------------|" >> "$OUTPUT_FILE"
      ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: chart: ''
        echo "| ${name} | ${chart.version} | ${chart.description or "N/A"} |" >> "$OUTPUT_FILE"
      '') charts)}
    '') chartDefs)}

    echo "" >> "$OUTPUT_FILE"
    echo "## Statistics" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "- Total charts: ${toString (builtins.length allCharts)}" >> "$OUTPUT_FILE"
    echo "- OCI charts: ${toString (builtins.length ociCharts)}" >> "$OUTPUT_FILE"
    echo "- Repository charts: ${toString (builtins.length repoCharts)}" >> "$OUTPUT_FILE"

    echo "Report saved to: $OUTPUT_FILE"
  '';

  # Save current chart versions to a file (for tracking)
  chart-save-versions = pkgs.writeShellScriptBin "chart-save-versions" ''
    set -euo pipefail

    OUTPUT_FILE="''${1:-chart-versions.json}"

    echo "Saving chart versions to $OUTPUT_FILE..."

    cat > "$OUTPUT_FILE" << 'EOF'
{
  "generated": "$(date -Iseconds)",
  "charts": {
    ${lib.concatStringsSep ",\n    " (map (chart:
      ''"${chart.name}": {"version": "${chart.version}", "category": "${chart.category}", "url": "${chart.url}"}''
    ) allCharts)}
  }
}
EOF

    echo "Done! Versions saved to $OUTPUT_FILE"
  '';

  # Export chart definitions as JSON (for programmatic access)
  chart-definitions-json = pkgs.writeText "chart-definitions.json" (builtins.toJSON chartDefs);
}
