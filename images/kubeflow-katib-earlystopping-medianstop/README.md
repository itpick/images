# kubeflow-katib-earlystopping-medianstop

Minimalist Kubeflow Katib Images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-katib-earlystopping-medianstop

# Load into Docker
nix build .#load-kubeflow-katib-earlystopping-medianstop-to-docker && ./result/bin/load-kubeflow-katib-earlystopping-medianstop-to-docker
```
