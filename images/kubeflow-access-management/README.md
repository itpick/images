# kubeflow-access-management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-access-management

# Load into Docker
nix build .#load-kubeflow-access-management-to-docker && ./result/bin/load-kubeflow-access-management-to-docker
```
