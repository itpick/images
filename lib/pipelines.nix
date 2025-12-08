# Pipeline Scripts
# ================
# Local CI/CD pipeline scripts for building, testing, and pushing container images.
# Automatically detects OS and uses Lima VM on macOS for Linux builds.
#
# ===================
# Prerequisites (macOS only)
# ===================
# One-time setup for Lima:
#   1. Install Lima: brew install lima
#   2. Start the default Lima VM: limactl start default
#   3. Install Nix inside Lima:
#      $ limactl shell default
#      $ curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
#      $ exit
#   4. Enable Nix flakes:
#      $ limactl shell default -- bash -c 'mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf'
#
# ===================
# Usage
# ===================
# Build all images:
#   $ nix run .#pipeline-build -- all
#
# Build specific image:
#   $ nix run .#pipeline-build -- nginx
#
# Build and load to Docker (macOS):
#   $ nix run .#pipeline-load -- nginx
#
# On macOS, commands automatically run inside Lima VM.
# On Linux, commands run directly.
#
# ===================
# Implementation
# ===================
# Usage in flake.nix:
#   let
#     pipelines = import ./lib/pipelines.nix {
#       inherit pkgs imageNames selectedImages imageCategories getPackageVersion discoveredImages;
#     };
#   in pipelines

{ pkgs, imageNames, selectedImages, imageCategories, getPackageVersion, discoveredImages }:

let
  inherit (pkgs) lib;

  # Common shell helpers for OS detection and Lima wrapping
  commonHelpers = ''
    # Detect OS
    detect_os() {
      case "$(uname -s)" in
        Darwin) echo "macos" ;;
        Linux)  echo "linux" ;;
        *)      echo "unknown" ;;
      esac
    }

    # Detect architecture
    detect_arch() {
      case "$(uname -m)" in
        x86_64|amd64)   echo "x86_64" ;;
        arm64|aarch64)  echo "aarch64" ;;
        *)              echo "unknown" ;;
      esac
    }

    OS=$(detect_os)
    ARCH=$(detect_arch)

    # Run a nix command - uses Lima on macOS, direct on Linux
    run_nix() {
      local cmd="$1"
      if [ "$OS" = "macos" ]; then
        limactl shell default -- bash -c ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && $cmd"
      else
        eval "$cmd"
      fi
    }

    # Check Lima is available and running (macOS only)
    check_lima() {
      if [ "$OS" = "macos" ]; then
        if ! command -v limactl &> /dev/null; then
          echo "Error: Lima is not installed. Install with: brew install lima"
          exit 1
        fi
        if ! limactl list | grep -q "default.*Running"; then
          echo "Error: Lima VM 'default' is not running. Start with: limactl start default"
          exit 1
        fi
      fi
    }
  '';

in {
  # Pipeline: Build images
  pipeline-build = pkgs.writeShellScriptBin "pipeline-build" ''
    set -euo pipefail

    ${commonHelpers}

    IMAGES="''${1:-selected}"
    PARALLEL="''${PARALLEL:-4}"

    echo "=== Nix Containers Build Pipeline ==="
    echo "OS: $OS ($ARCH)"
    echo "Target: $IMAGES"
    echo ""

    check_lima

    case "$IMAGES" in
      all)
        echo "Building ALL images..."
        run_nix "nix build .#all-images --print-build-logs -j$PARALLEL --no-link"
        ;;
      selected)
        echo "Building SELECTED images..."
        run_nix "nix build .#selected-images --print-build-logs -j$PARALLEL --no-link"
        ;;
      infrastructure|database|web|runtime|cli|devops|nix|build)
        echo "Building $IMAGES category..."
        run_nix "nix build .#$IMAGES-images --print-build-logs -j$PARALLEL --no-link"
        ;;
      *)
        echo "Building image: $IMAGES"
        run_nix "nix build .#$IMAGES --print-build-logs --no-link"
        ;;
    esac

    echo ""
    echo "Build complete!"
  '';

  # Pipeline: Load images to local Docker daemon
  # On macOS: exports to tarball in Lima, copies to macOS, loads into Docker
  # On Linux: loads directly via docker-daemon
  # Versions are embedded at build time for efficiency
  pipeline-load = pkgs.writeShellScriptBin "pipeline-load" ''
    set -euo pipefail

    ${commonHelpers}

    IMAGES="''${1:-selected}"

    echo "=== Nix Containers Load Pipeline ==="
    echo "OS: $OS ($ARCH)"
    echo "Target: $IMAGES"
    echo ""

    check_lima

    # Version lookup table (generated at Nix build time)
    # Supports both regular images (nginx -> 1.28.0) and dev images (nginx-dev -> 1.28.0-dev)
    get_version() {
      local image="$1"
      # Check if this is a dev image
      if [[ "$image" == *-dev ]]; then
        local base_image="''${image%-dev}"
        local base_version
        base_version=$(get_base_version "$base_image")
        echo "''${base_version}-dev"
      else
        get_base_version "$image"
      fi
    }

    get_base_version() {
      local image="$1"
      case "$image" in
        ${lib.concatStringsSep "\n        " (map (imageName:
          let
            version = getPackageVersion imageName;
            # Sanitize version for Docker tag (replace + with -)
            safeVersion = builtins.replaceStrings ["+"] ["-"] version;
          in
          ''${imageName}) echo "${safeVersion}" ;;''
        ) discoveredImages)}
        *) echo "latest" ;;
      esac
    }

    # Determine which images to load
    case "$IMAGES" in
      all)
        IMAGE_LIST="${lib.concatStringsSep " " imageNames}"
        ;;
      all-dev)
        # Load dev variants of all images
        IMAGE_LIST="${lib.concatStringsSep " " (map (n: "${n}-dev") imageNames)}"
        ;;
      selected)
        IMAGE_LIST="${lib.concatStringsSep " " selectedImages}"
        ;;
      selected-dev)
        IMAGE_LIST="${lib.concatStringsSep " " (map (n: "${n}-dev") selectedImages)}"
        ;;
      infrastructure)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.infrastructure}"
        ;;
      database)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.database}"
        ;;
      web)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.web}"
        ;;
      runtime)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.runtime}"
        ;;
      cli)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.cli}"
        ;;
      devops)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.devops}"
        ;;
      nix)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.nix}"
        ;;
      build)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.build}"
        ;;
      *)
        IMAGE_LIST="$IMAGES"
        ;;
    esac

    # Local cache directory for tarballs
    LOCAL_TMP="$HOME/.cache/nix-containers"
    mkdir -p "$LOCAL_TMP"

    for IMAGE_NAME in $IMAGE_LIST; do
      VERSION=$(get_version "$IMAGE_NAME")
      echo ""
      echo "Loading: $IMAGE_NAME:$VERSION"
      echo "----------------------------------------"

      if [ "$OS" = "macos" ]; then
        # macOS: Export to tarball in Lima /tmp, copy to macOS, load into Docker
        LIMA_TARBALL="/tmp/$IMAGE_NAME.tar"
        LOCAL_TARBALL="$LOCAL_TMP/$IMAGE_NAME.tar"

        # Clean up any existing tarballs
        limactl shell default -- rm -f "$LIMA_TARBALL" 2>/dev/null || true
        rm -f "$LOCAL_TARBALL" 2>/dev/null || true

        # Export with version tag directly
        echo "  Building and exporting to tarball..."
        run_nix "nix run .#$IMAGE_NAME.copyTo -- docker-archive:$LIMA_TARBALL:$IMAGE_NAME:$VERSION"

        echo "  Copying tarball from Lima..."
        limactl copy "default:$LIMA_TARBALL" "$LOCAL_TARBALL"

        echo "  Loading into Docker..."
        docker load -i "$LOCAL_TARBALL"

        echo "  Cleaning up tarballs..."
        rm -f "$LOCAL_TARBALL"
        limactl shell default -- rm -f "$LIMA_TARBALL"

        # Also tag as latest
        if [ "$VERSION" != "latest" ]; then
          echo "  Tagging as latest..."
          docker tag "$IMAGE_NAME:$VERSION" "$IMAGE_NAME:latest"
        fi
      else
        # Linux: Load directly via docker-daemon with version tag
        echo "  Loading directly to Docker daemon..."
        run_nix "nix run .#$IMAGE_NAME.copyTo -- docker-daemon:$IMAGE_NAME:$VERSION"

        # Also tag as latest
        if [ "$VERSION" != "latest" ]; then
          echo "  Tagging as latest..."
          docker tag "$IMAGE_NAME:$VERSION" "$IMAGE_NAME:latest"
        fi
      fi

      echo "  Done!"
    done

    echo ""
    echo "=== Load Complete ==="
    docker images | head -20
  '';

  # Pipeline: Test images (build + basic validation)
  pipeline-test = pkgs.writeShellScriptBin "pipeline-test" ''
    set -euo pipefail

    ${commonHelpers}

    IMAGES="''${1:-selected}"

    echo "=== Nix Containers Test Pipeline ==="
    echo "OS: $OS ($ARCH)"
    echo "Target: $IMAGES"
    echo ""

    check_lima

    # Determine which images to test
    case "$IMAGES" in
      all)
        IMAGE_LIST="${lib.concatStringsSep " " imageNames}"
        ;;
      selected)
        IMAGE_LIST="${lib.concatStringsSep " " selectedImages}"
        ;;
      infrastructure)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.infrastructure}"
        ;;
      database)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.database}"
        ;;
      web)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.web}"
        ;;
      runtime)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.runtime}"
        ;;
      cli)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.cli}"
        ;;
      devops)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.devops}"
        ;;
      nix)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.nix}"
        ;;
      build)
        IMAGE_LIST="${lib.concatStringsSep " " imageCategories.build}"
        ;;
      *)
        IMAGE_LIST="$IMAGES"
        ;;
    esac

    TOTAL=0
    BUILD_SUCCESS=0

    for IMAGE_NAME in $IMAGE_LIST; do
      TOTAL=$((TOTAL + 1))
      echo ""
      echo "[$TOTAL] Testing: $IMAGE_NAME"
      echo "----------------------------------------"

      # Build
      echo "  Building..."
      if run_nix "nix build .#$IMAGE_NAME --no-link" 2>&1; then
        BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        echo "  Build: OK"
      else
        echo "  Build: FAILED"
      fi
    done

    echo ""
    echo "=== Test Summary ==="
    echo "Total images:  $TOTAL"
    echo "Build success: $BUILD_SUCCESS"

    if [ "$BUILD_SUCCESS" -eq "$TOTAL" ]; then
      echo ""
      echo "All builds passed!"
      exit 0
    else
      echo ""
      echo "Some builds failed."
      exit 1
    fi
  '';

  # Pipeline: Push images to registry
  # Usage: REGISTRY=ghcr.io REPO=user/repo nix run .#pipeline-push -- all
  pipeline-push = pkgs.writeShellScriptBin "pipeline-push" ''
    set -euo pipefail

    ${commonHelpers}

    IMAGES="''${1:-selected}"
    REGISTRY="''${REGISTRY:-}"
    REPO="''${REPO:-}"

    if [ -z "$REGISTRY" ] || [ -z "$REPO" ]; then
      echo "Error: REGISTRY and REPO environment variables must be set"
      echo "Usage: REGISTRY=ghcr.io REPO=user/repo nix run .#pipeline-push -- all"
      exit 1
    fi

    echo "=== Nix Containers Push Pipeline ==="
    echo "OS: $OS ($ARCH)"
    echo "Target: $IMAGES"
    echo "Registry: $REGISTRY/$REPO"
    echo ""

    check_lima

    # Determine which images to push
    case "$IMAGES" in
      all)
        IMAGE_LIST="${lib.concatStringsSep " " imageNames}"
        ;;
      selected)
        IMAGE_LIST="${lib.concatStringsSep " " selectedImages}"
        ;;
      infrastructure|database|web|runtime|cli|devops|nix|build)
        IMAGE_LIST="$(run_nix "nix eval --raw '.#imageCategories.$IMAGES' --apply 'builtins.concatStringsSep \" \"'" 2>/dev/null || echo "")"
        ;;
      *)
        IMAGE_LIST="$IMAGES"
        ;;
    esac

    for IMAGE_NAME in $IMAGE_LIST; do
      echo ""
      echo "Pushing: $IMAGE_NAME"
      echo "----------------------------------------"

      DEST="$REGISTRY/$REPO/$IMAGE_NAME"

      echo "  Pushing to $DEST:latest..."
      run_nix "nix run .#$IMAGE_NAME.copyTo -- docker://$DEST:latest"

      echo "  Done!"
    done

    echo ""
    echo "=== Push Complete ==="
  '';

  # Pipeline: Full pipeline (build, test, optionally load to Docker)
  pipeline = pkgs.writeShellScriptBin "pipeline" ''
    set -euo pipefail

    ${commonHelpers}

    IMAGES="''${1:-selected}"
    SKIP_TEST="''${SKIP_TEST:-false}"
    LOAD_DOCKER="''${LOAD_DOCKER:-true}"

    echo "=========================================="
    echo "  Nix Containers Full Pipeline"
    echo "=========================================="
    echo ""
    echo "OS: $OS ($ARCH)"
    echo "Target: $IMAGES"
    echo "Skip test: $SKIP_TEST"
    echo "Load to Docker: $LOAD_DOCKER"
    echo ""

    check_lima

    # Build
    echo ">>> STAGE: BUILD"
    run_nix "nix run .#pipeline-build -- $IMAGES"

    # Test
    if [ "$SKIP_TEST" != "true" ]; then
      echo ""
      echo ">>> STAGE: TEST"
      run_nix "nix run .#pipeline-test -- $IMAGES"
    else
      echo ""
      echo ">>> STAGE: TEST (skipped)"
    fi

    # Load to Docker
    if [ "$LOAD_DOCKER" = "true" ]; then
      echo ""
      echo ">>> STAGE: LOAD TO DOCKER"
      # Run pipeline-load directly (not via run_nix) since it handles Lima internally
      ${pkgs.nix}/bin/nix run .#pipeline-load -- "$IMAGES"
    else
      echo ""
      echo ">>> STAGE: LOAD TO DOCKER (skipped)"
    fi

    echo ""
    echo "=========================================="
    echo "  Pipeline Complete!"
    echo "=========================================="
  '';

  # Pipeline: Check for version changes
  pipeline-check-versions = pkgs.writeShellScriptBin "pipeline-check-versions" ''
    set -euo pipefail

    ${commonHelpers}

    VERSIONS_FILE="''${1:-package-versions.json}"

    echo "=== Checking for Version Changes ==="
    echo "OS: $OS ($ARCH)"
    echo ""

    check_lima

    if [ -f "$VERSIONS_FILE" ]; then
      echo "Comparing with $VERSIONS_FILE..."

      CHANGED=""
      ${lib.concatStringsSep "\n" (map (imageName:
        let version = getPackageVersion imageName; in
        ''
          OLD_VER=$(${pkgs.jq}/bin/jq -r '.[\"${imageName}\"] // \"unknown\"' "$VERSIONS_FILE" 2>/dev/null || echo "unknown")
          NEW_VER="${version}"
          if [ "$OLD_VER" != "$NEW_VER" ]; then
            echo "  ${imageName}: $OLD_VER -> $NEW_VER"
            CHANGED="$CHANGED ${imageName}"
          fi
        ''
      ) discoveredImages)}

      if [ -n "$CHANGED" ]; then
        echo ""
        echo "Changed images:$CHANGED"
      else
        echo ""
        echo "No version changes detected."
      fi
    else
      echo "No previous versions file found at $VERSIONS_FILE"
    fi
  '';

  # Pipeline: Save current versions
  pipeline-save-versions = pkgs.writeShellScriptBin "pipeline-save-versions" ''
    set -euo pipefail

    VERSIONS_FILE="''${1:-package-versions.json}"

    echo "Saving package versions to $VERSIONS_FILE..."

    cat > "$VERSIONS_FILE" << 'VERSIONS_EOF'
    {
      ${lib.concatStringsSep ",\n  " (map (imageName:
        let version = getPackageVersion imageName; in
        ''"${imageName}": "${version}"''
      ) discoveredImages)}
    }
    VERSIONS_EOF

    echo "Done! Versions saved to $VERSIONS_FILE"
  '';
}
