# helm-fips

The Kubernetes Package Manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-fips

# Load into Docker
nix build .#load-helm-fips-to-docker && ./result/bin/load-helm-fips-to-docker
```
