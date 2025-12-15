# rke2-cloud-provider-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rke2-cloud-provider-fips

# Load into Docker
nix build .#load-rke2-cloud-provider-fips-to-docker && ./result/bin/load-rke2-cloud-provider-fips-to-docker
```
