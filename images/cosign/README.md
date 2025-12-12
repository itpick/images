# cosign

Minimalist Wolfi-based Cosign images for signing and verifying images using Sigstore

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 177.50 MB |
| Uncompressed | ~443.76 MB |

## Usage

```bash
# Build the image
nix build .#cosign

# Load into Docker
nix build .#load-cosign-to-docker && ./result/bin/load-cosign-to-docker
```
