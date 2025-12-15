# calico-typha-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-typha-fips

# Load into Docker
nix build .#load-calico-typha-fips-to-docker && ./result/bin/load-calico-typha-fips-to-docker
```
