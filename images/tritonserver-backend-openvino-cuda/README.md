# tritonserver-backend-openvino-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-backend-openvino-cuda

# Load into Docker
nix build .#load-tritonserver-backend-openvino-cuda-to-docker && ./result/bin/load-tritonserver-backend-openvino-cuda-to-docker
```
