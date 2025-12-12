# grype

A vulnerability scanner for container images and filesystems

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 150.68 MB |
| Uncompressed | ~376.70 MB |

## Usage

```bash
# Build the image
nix build .#grype

# Load into Docker
nix build .#load-grype-to-docker && ./result/bin/load-grype-to-docker
```
