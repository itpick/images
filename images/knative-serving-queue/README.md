# knative-serving-queue

Knative Serving builds on Kubernetes to support deploying and serving of applications and functions as serverless containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving-queue

# Load into Docker
nix build .#load-knative-serving-queue-to-docker && ./result/bin/load-knative-serving-queue-to-docker
```
