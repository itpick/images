# trivy-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trivy-fips

# Load into Docker
nix build .#load-trivy-fips-to-docker && ./result/bin/load-trivy-fips-to-docker
```
