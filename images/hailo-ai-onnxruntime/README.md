# hailo-ai-onnxruntime

Container image with ONNX Runtime, HailoRT, and the Hailo Execution Provider for hardware-accelerated ML inference

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hailo-ai-onnxruntime

# Load into Docker
nix build .#load-hailo-ai-onnxruntime-to-docker && ./result/bin/load-hailo-ai-onnxruntime-to-docker
```
