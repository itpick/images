# cosign

Minimalist Wolfi-based Cosign images for signing and verifying images using Sigstore

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cosign

# Load into Docker
nix build .#load-cosign-to-docker && ./result/bin/load-cosign-to-docker
```
