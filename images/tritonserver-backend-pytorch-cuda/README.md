# tritonserver-backend-pytorch-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-pytorch-cuda

# Load into Docker
nix build .#load-tritonserver-backend-pytorch-cuda-to-docker && ./result/bin/load-tritonserver-backend-pytorch-cuda-to-docker
```
