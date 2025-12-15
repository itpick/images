# velero-restore-helper

Backup and migrate Kubernetes applications and their persistent volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-restore-helper

# Load into Docker
nix build .#load-velero-restore-helper-to-docker && ./result/bin/load-velero-restore-helper-to-docker
```
