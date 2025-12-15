# smarter-device-manager

Minimalist Wolfi-based image for smarter device manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#smarter-device-manager

# Load into Docker
nix build .#load-smarter-device-manager-to-docker && ./result/bin/load-smarter-device-manager-to-docker
```
