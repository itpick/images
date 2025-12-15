# tritonserver-backend-tensorrtllm-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-tensorrtllm-cuda

# Load into Docker
nix build .#load-tritonserver-backend-tensorrtllm-cuda-to-docker && ./result/bin/load-tritonserver-backend-tensorrtllm-cuda-to-docker
```
