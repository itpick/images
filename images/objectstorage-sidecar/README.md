# objectstorage-sidecar

Container Object Storage Interface (COSI) controller and sidecar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#objectstorage-sidecar

# Load into Docker
nix build .#load-objectstorage-sidecar-to-docker && ./result/bin/load-objectstorage-sidecar-to-docker
```
