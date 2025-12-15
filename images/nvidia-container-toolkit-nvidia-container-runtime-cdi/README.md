# nvidia-container-toolkit-nvidia-container-runtime-cdi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit-nvidia-container-runtime-cdi

# Load into Docker
nix build .#load-nvidia-container-toolkit-nvidia-container-runtime-cdi-to-docker && ./result/bin/load-nvidia-container-toolkit-nvidia-container-runtime-cdi-to-docker
```
