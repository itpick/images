# calico-node-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-node-fips

# Load into Docker
nix build .#load-calico-node-fips-to-docker && ./result/bin/load-calico-node-fips-to-docker
```
