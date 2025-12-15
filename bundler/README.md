# BigBang Image Bundler

This directory contains tools and image lists for creating portable BigBang container image bundles.

## Overview

The bundler exports nix2container images to docker-archive format (`.tar` files) that can be:
- Loaded into Docker with `docker load`
- Pushed to registries with `skopeo` or `crane`
- Transferred to air-gapped environments

## Files

| File | Description |
|------|-------------|
| `bigbang.txt` | List of BigBang image names to include in the bundle |
| `export-bundle.sh` | Script to export images to docker-archive format |

## Bundle Structure

A completed bundle contains:
```
bigbang-bundle-{arch}.tar.gz
├── images/
│   ├── alertmanager.tar      # docker-archive format
│   ├── alloy.tar
│   ├── ...
│   └── yq.tar
├── manifest.json             # Machine-readable metadata
└── README.txt                # Usage instructions
```

## Building Bundles

### Prerequisites

- Nix with flakes enabled
- Access to a Linux builder (native or remote)
- ~50GB free disk space per architecture

### Export Process

The export uses `skopeo` from nix2container (which has the `nix:` transport) to convert nix2container image JSONs to docker-archive tarballs.

```bash
# 1. Get skopeo with nix: transport support
SKOPEO_PATH=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths | grep -v man)
SKOPEO="$SKOPEO_PATH/bin/skopeo"

# 2. Build and export each image
IMAGE_JSON=$(nix build .#alertmanager --no-link --print-out-paths)
$SKOPEO copy --insecure-policy "nix:$IMAGE_JSON" "docker-archive:alertmanager.tar:alertmanager:latest"
```

### Using the Export Script

```bash
# From the images directory
cd /path/to/nix-containers/images

# Export all images in bigbang.txt
./bundler/export-bundle.sh /tmp/bigbang-output bundler/bigbang.txt
```

### Building for Multiple Architectures

**ARM64 (aarch64-linux)** - Using Lima on macOS:
```bash
limactl shell default -- bash -c "cd /path/to/images && ./bundler/export-bundle.sh /tmp/bundle-arm64"
```

**x86_64 (amd64)** - Using SSH remote builder:
```bash
ssh builder "cd /tmp/nix-containers/images && ./bundler/export-bundle.sh /tmp/bundle-x86"
```

## Using Bundles

### Extract Bundle
```bash
tar -xzvf bigbang-bundle-aarch64.tar.gz
```

### Load All Images into Docker
```bash
for f in images/*.tar; do
    echo "Loading $(basename $f .tar)..."
    docker load < "$f"
done
```

### Load Single Image
```bash
docker load < images/alertmanager.tar
docker images | grep alertmanager
```

### Push to Registry
```bash
# Using skopeo
skopeo copy docker-archive:images/alertmanager.tar docker://myregistry.com/alertmanager:latest

# Using crane
crane push images/alertmanager.tar myregistry.com/alertmanager:latest
```

## Creating Multi-Arch Images

To create true multi-arch images that work on both ARM64 and x86_64:

1. **Build bundles for both architectures**
2. **Push with architecture-specific tags:**
   ```bash
   crane push alertmanager-arm64.tar myregistry.com/alertmanager:latest-arm64
   crane push alertmanager-amd64.tar myregistry.com/alertmanager:latest-amd64
   ```

3. **Create and push manifest list:**
   ```bash
   docker manifest create myregistry.com/alertmanager:latest \
     myregistry.com/alertmanager:latest-amd64 \
     myregistry.com/alertmanager:latest-arm64

   docker manifest push myregistry.com/alertmanager:latest
   ```

## Bundle Sizes

Typical bundle sizes (compressed):

| Architecture | Compressed | Uncompressed |
|-------------|------------|--------------|
| aarch64 | ~5.8 GB | ~18 GB |
| x86_64 | ~6.1 GB | ~18 GB |

## Image List Format

The `bigbang.txt` file contains one image name per line:
- Lines starting with `#` are comments
- Empty lines are ignored
- Image names must match flake output names (e.g., `alertmanager`, `gitlab-runner`)

Example:
```
# BigBang Core Images
alertmanager
alloy
kyverno

# GitLab
gitlab-runner
gitlab-shell
```

## Security Scanning

All images can be scanned for vulnerabilities using **Grype** and have SBOMs generated with **Syft**.

### Scan a Single Image

```bash
# Scan a single image and save results to ./scan-results/<image>/
nix run .#scan-image -- alertmanager

# Specify custom output directory
nix run .#scan-image -- alertmanager /path/to/output
```

### Scan All BigBang Images

```bash
# Scan all images in bigbang.txt
nix run .#scan-all-bigbang -- ./bigbang-scan-results
```

### Scan Output Files

Each scanned image produces:

| File | Description |
|------|-------------|
| `sbom.json` | Full SBOM in Syft JSON format |
| `sbom-cyclonedx.json` | SBOM in CycloneDX format |
| `sbom-spdx.json` | SBOM in SPDX format |
| `sbom.txt` | Human-readable package list |
| `vulnerabilities.json` | Grype vulnerability scan (JSON) |
| `vulnerabilities.txt` | Human-readable vulnerability list |
| `scan-summary.json` | Summary with counts |
| `SCAN-SUMMARY.md` | Human-readable summary |
| `<image>-scan-results.tar.gz` | Compressed archive of all results |

### Scan Summary Format

The `scan-summary.json` includes:

```json
{
  "imageName": "alertmanager",
  "scanTime": "2025-12-14T12:00:00Z",
  "scanTimeDisplay": "Dec 14, 2025, 12:00:00 PM (GMT-0600)",
  "packages": 42,
  "vulnerabilities": {
    "total": 5,
    "critical": 0,
    "high": 1,
    "medium": 2,
    "low": 2
  }
}
```

### Image Labels

All images include build metadata labels:

| Label | Description |
|-------|-------------|
| `io.nix-containers.build-type` | `source` or `binary` |
| `io.nix-containers.build-method` | Human-readable description |

- **source**: Built from source code using Nix
- **binary**: Pre-built binary packaged with Nix

### Adding Build Type to Images

In your image's `default.nix`:

```nix
mkImage {
  drv = pkgs.myApp;
  name = "my-app";
  buildType = "source";  # or "binary"
  # ...
}
```

## Troubleshooting

### "nix: transport not available"
Use skopeo from nix2container, not the system skopeo:
```bash
nix build github:nlewo/nix2container#skopeo-nix2container
```

### Build fails on macOS
nix2container images must be built on Linux. Use:
- Lima VM for ARM64
- Remote SSH builder for x86_64
- Docker with nix installed

### Disk space errors
Each architecture needs ~50GB during export. Clean up with:
```bash
nix-collect-garbage -d
```

### Scan fails with OCI export error
Make sure you're running on Linux or through a Linux builder. Scanning requires exporting images to OCI format.
