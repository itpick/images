# local-path-provisioner-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-path-provisioner-fips

# Load into Docker
nix build .#load-local-path-provisioner-fips-to-docker && ./result/bin/load-local-path-provisioner-fips-to-docker
```
