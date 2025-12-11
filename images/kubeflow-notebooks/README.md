# kubeflow-notebooks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 15s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kubeflow-notebooks

# Load into Docker
nix build .#load-kubeflow-notebooks-to-docker && ./result/bin/load-kubeflow-notebooks-to-docker
```
