# neuvector-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-controller-fips

# Load into Docker
nix build .#load-neuvector-controller-fips-to-docker && ./result/bin/load-neuvector-controller-fips-to-docker
```
