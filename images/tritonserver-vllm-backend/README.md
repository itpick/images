# tritonserver-vllm-backend

The Triton Inference Server provides an optimized cloud and edge inferencing solution with vllm backend

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-vllm-backend

# Load into Docker
nix build .#load-tritonserver-vllm-backend-to-docker && ./result/bin/load-tritonserver-vllm-backend-to-docker
```
