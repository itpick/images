# tritonserver-pytorch-backend

The Triton backend for the PyTorch TorchScript models

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-pytorch-backend

# Load into Docker
nix build .#load-tritonserver-pytorch-backend-to-docker && ./result/bin/load-tritonserver-pytorch-backend-to-docker
```
