# tritonserver-trtllm-backend

The Triton Inference Server provides an optimized cloud and edge inferencing solution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-trtllm-backend

# Load into Docker
nix build .#load-tritonserver-trtllm-backend-to-docker && ./result/bin/load-tritonserver-trtllm-backend-to-docker
```
