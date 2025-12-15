# nvidia-container-toolkit-nvidia-container-runtime-hook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit-nvidia-container-runtime-hook

# Load into Docker
nix build .#load-nvidia-container-toolkit-nvidia-container-runtime-hook-to-docker && ./result/bin/load-nvidia-container-toolkit-nvidia-container-runtime-hook-to-docker
```
