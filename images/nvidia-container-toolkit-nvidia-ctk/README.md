# nvidia-container-toolkit-nvidia-ctk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit-nvidia-ctk

# Load into Docker
nix build .#load-nvidia-container-toolkit-nvidia-ctk-to-docker && ./result/bin/load-nvidia-container-toolkit-nvidia-ctk-to-docker
```
