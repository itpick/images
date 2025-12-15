# nvidia-gpu-driver

Tools necessary for GPU and feature discovery for NVIDIA GPU driver container that allows the provisioning of the NVIDIA driver through the use of containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-gpu-driver

# Load into Docker
nix build .#load-nvidia-gpu-driver-to-docker && ./result/bin/load-nvidia-gpu-driver-to-docker
```
