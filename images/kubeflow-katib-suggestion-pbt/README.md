# kubeflow-katib-suggestion-pbt

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-suggestion-pbt

# Load into Docker
nix build .#load-kubeflow-katib-suggestion-pbt-to-docker && ./result/bin/load-kubeflow-katib-suggestion-pbt-to-docker
```
