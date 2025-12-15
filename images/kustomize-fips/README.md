# kustomize-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kustomize-fips

# Load into Docker
nix build .#load-kustomize-fips-to-docker && ./result/bin/load-kustomize-fips-to-docker
```
