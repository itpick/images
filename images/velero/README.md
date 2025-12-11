# velero

Backup and migrate Kubernetes applications and their persistent volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#velero

# Load into Docker
nix build .#load-velero-to-docker && ./result/bin/load-velero-to-docker
```
