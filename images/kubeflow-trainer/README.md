# kubeflow-trainer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 59s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 139.75 MB |
| Uncompressed | ~349.39 MB |

## Usage

```bash
# Build the image
nix build .#kubeflow-trainer

# Load into Docker
nix build .#load-kubeflow-trainer-to-docker && ./result/bin/load-kubeflow-trainer-to-docker
```
