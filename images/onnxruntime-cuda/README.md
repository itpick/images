# onnxruntime-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#onnxruntime-cuda

# Load into Docker
nix build .#load-onnxruntime-cuda-to-docker && ./result/bin/load-onnxruntime-cuda-to-docker
```
