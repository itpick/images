# tritonserver-vllm-backend-fips

The Triton Inference Server provides an optimized cloud and edge inferencing solution with vllm backend

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-vllm-backend-fips

# Load into Docker
nix build .#load-tritonserver-vllm-backend-fips-to-docker && ./result/bin/load-tritonserver-vllm-backend-fips-to-docker
```
