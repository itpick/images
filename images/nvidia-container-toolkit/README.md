# nvidia-container-toolkit

The NVIDIA Container Toolkit allows users to build and run GPU accelerated containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit

# Load into Docker
nix build .#load-nvidia-container-toolkit-to-docker && ./result/bin/load-nvidia-container-toolkit-to-docker
```
