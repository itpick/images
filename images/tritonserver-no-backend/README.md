# tritonserver-no-backend

The Triton Inference Server provides an optimized cloud and edge inferencing solution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-no-backend

# Load into Docker
nix build .#load-tritonserver-no-backend-to-docker && ./result/bin/load-tritonserver-no-backend-to-docker
```
