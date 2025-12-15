# kubeflow-katib-suggestion-goptuna

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-suggestion-goptuna

# Load into Docker
nix build .#load-kubeflow-katib-suggestion-goptuna-to-docker && ./result/bin/load-kubeflow-katib-suggestion-goptuna-to-docker
```
