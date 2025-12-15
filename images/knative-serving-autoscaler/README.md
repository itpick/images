# knative-serving-autoscaler

Knative Serving builds on Kubernetes to support deploying and serving of applications and functions as serverless containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving-autoscaler

# Load into Docker
nix build .#load-knative-serving-autoscaler-to-docker && ./result/bin/load-knative-serving-autoscaler-to-docker
```
