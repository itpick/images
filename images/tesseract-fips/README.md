# tesseract-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tesseract-fips

# Load into Docker
nix build .#load-tesseract-fips-to-docker && ./result/bin/load-tesseract-fips-to-docker
```
