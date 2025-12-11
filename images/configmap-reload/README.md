# configmap-reload

configmap-reload is a simple binary to trigger a reload when Kubernetes ConfigMaps or Secrets, mounted into pods, are updated

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 15s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#configmap-reload

# Load into Docker
nix build .#load-configmap-reload-to-docker && ./result/bin/load-configmap-reload-to-docker
```
