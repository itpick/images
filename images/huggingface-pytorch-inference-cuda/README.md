# huggingface-pytorch-inference-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#huggingface-pytorch-inference-cuda

# Load into Docker
nix build .#load-huggingface-pytorch-inference-cuda-to-docker && ./result/bin/load-huggingface-pytorch-inference-cuda-to-docker
```
