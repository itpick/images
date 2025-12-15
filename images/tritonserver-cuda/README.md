# tritonserver-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-cuda

# Load into Docker
nix build .#load-tritonserver-cuda-to-docker && ./result/bin/load-tritonserver-cuda-to-docker
```
