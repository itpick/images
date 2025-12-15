# local-static-provisioner-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-static-provisioner-fips

# Load into Docker
nix build .#load-local-static-provisioner-fips-to-docker && ./result/bin/load-local-static-provisioner-fips-to-docker
```
