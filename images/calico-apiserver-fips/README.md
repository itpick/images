# calico-apiserver-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-apiserver-fips

# Load into Docker
nix build .#load-calico-apiserver-fips-to-docker && ./result/bin/load-calico-apiserver-fips-to-docker
```
