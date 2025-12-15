# nvidia-device-plugin

Minimal nvidia-device-plugin container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-device-plugin

# Load into Docker
nix build .#load-nvidia-device-plugin-to-docker && ./result/bin/load-nvidia-device-plugin-to-docker
```
