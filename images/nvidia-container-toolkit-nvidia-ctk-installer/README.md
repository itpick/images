# nvidia-container-toolkit-nvidia-ctk-installer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit-nvidia-ctk-installer

# Load into Docker
nix build .#load-nvidia-container-toolkit-nvidia-ctk-installer-to-docker && ./result/bin/load-nvidia-container-toolkit-nvidia-ctk-installer-to-docker
```
