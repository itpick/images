# local-volume-provisioner-fips

Static provisioner of local volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-volume-provisioner-fips

# Load into Docker
nix build .#load-local-volume-provisioner-fips-to-docker && ./result/bin/load-local-volume-provisioner-fips-to-docker
```
