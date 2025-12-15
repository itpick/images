# tritonserver-backend-onnxruntime-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-onnxruntime-cuda

# Load into Docker
nix build .#load-tritonserver-backend-onnxruntime-cuda-to-docker && ./result/bin/load-tritonserver-backend-onnxruntime-cuda-to-docker
```
