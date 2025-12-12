# crane

Minimalist Wolfi-based crane image to interact with container registries. Crane is used for inspecting and manipulating container images, allowing you to view manifests, verify image layers, and check cryptographic signatures

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 86.89 MB |
| Uncompressed | ~217.23 MB |

## Usage

```bash
# Build the image
nix build .#crane

# Load into Docker
nix build .#load-crane-to-docker && ./result/bin/load-crane-to-docker
```
