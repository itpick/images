# kaniko-fips

Build Container Images In Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kaniko-fips

# Load into Docker
nix build .#load-kaniko-fips-to-docker && ./result/bin/load-kaniko-fips-to-docker
```
