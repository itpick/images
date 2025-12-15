# tritonserver-backend-vllm-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-vllm-cuda

# Load into Docker
nix build .#load-tritonserver-backend-vllm-cuda-to-docker && ./result/bin/load-tritonserver-backend-vllm-cuda-to-docker
```
