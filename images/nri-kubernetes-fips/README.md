# nri-kubernetes-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-kubernetes-fips

# Load into Docker
nix build .#load-nri-kubernetes-fips-to-docker && ./result/bin/load-nri-kubernetes-fips-to-docker
```
