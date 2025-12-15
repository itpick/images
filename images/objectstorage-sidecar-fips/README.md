# objectstorage-sidecar-fips

Container Object Storage Interface (COSI) controller and sidecar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#objectstorage-sidecar-fips

# Load into Docker
nix build .#load-objectstorage-sidecar-fips-to-docker && ./result/bin/load-objectstorage-sidecar-fips-to-docker
```
