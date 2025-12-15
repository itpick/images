# vertical-pod-autoscaler-updater

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vertical-pod-autoscaler-updater

# Load into Docker
nix build .#load-vertical-pod-autoscaler-updater-to-docker && ./result/bin/load-vertical-pod-autoscaler-updater-to-docker
```
