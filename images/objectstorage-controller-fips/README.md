# objectstorage-controller-fips

Container Object Storage Interface (COSI) controller and sidecar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#objectstorage-controller-fips

# Load into Docker
nix build .#load-objectstorage-controller-fips-to-docker && ./result/bin/load-objectstorage-controller-fips-to-docker
```
