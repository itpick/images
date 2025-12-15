# tritonserver-backend-tensorrt-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-tensorrt-cuda

# Load into Docker
nix build .#load-tritonserver-backend-tensorrt-cuda-to-docker && ./result/bin/load-tritonserver-backend-tensorrt-cuda-to-docker
```
