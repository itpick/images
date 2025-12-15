# openmpi-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openmpi-cuda

# Load into Docker
nix build .#load-openmpi-cuda-to-docker && ./result/bin/load-openmpi-cuda-to-docker
```
