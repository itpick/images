# gpu-operator

The NVIDIA GPU Operator bootstraps, configures, and manages GPUs in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpu-operator

# Load into Docker
nix build .#load-gpu-operator-to-docker && ./result/bin/load-gpu-operator-to-docker
```
