# cosign-fips

Minimalist Wolfi-based Cosign image for signing and verifying images using Sigstore

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cosign-fips

# Load into Docker
nix build .#load-cosign-fips-to-docker && ./result/bin/load-cosign-fips-to-docker
```
