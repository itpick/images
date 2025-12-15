# tritonserver-backend-vllm-meta-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-vllm-meta-cuda

# Load into Docker
nix build .#load-tritonserver-backend-vllm-meta-cuda-to-docker && ./result/bin/load-tritonserver-backend-vllm-meta-cuda-to-docker
```
