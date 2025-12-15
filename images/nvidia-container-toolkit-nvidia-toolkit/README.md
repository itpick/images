# nvidia-container-toolkit-nvidia-toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit-nvidia-toolkit

# Load into Docker
nix build .#load-nvidia-container-toolkit-nvidia-toolkit-to-docker && ./result/bin/load-nvidia-container-toolkit-nvidia-toolkit-to-docker
```
