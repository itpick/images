# klipper-helm

Helm integration job image for K3s/RKE2 with automated chart lifecycle management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#klipper-helm

# Load into Docker
nix build .#load-klipper-helm-to-docker && ./result/bin/load-klipper-helm-to-docker
```
