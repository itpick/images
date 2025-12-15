# objectstorage-controller

Container Object Storage Interface (COSI) controller and sidecar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#objectstorage-controller

# Load into Docker
nix build .#load-objectstorage-controller-to-docker && ./result/bin/load-objectstorage-controller-to-docker
```
