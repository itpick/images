# huggingface-pytorch-inference

General-purpose PyTorch inference Deep Learning Container for inferencing on Sagemaker instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#huggingface-pytorch-inference

# Load into Docker
nix build .#load-huggingface-pytorch-inference-to-docker && ./result/bin/load-huggingface-pytorch-inference-to-docker
```
