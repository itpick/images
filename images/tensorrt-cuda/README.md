# tensorrt-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tensorrt-cuda

# Load into Docker
nix build .#load-tensorrt-cuda-to-docker && ./result/bin/load-tensorrt-cuda-to-docker
```
