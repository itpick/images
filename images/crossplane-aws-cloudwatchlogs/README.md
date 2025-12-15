# crossplane-aws-cloudwatchlogs

Crossplane provider for managing Amazon Web Services (AWS) config services in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-cloudwatchlogs

# Load into Docker
nix build .#load-crossplane-aws-cloudwatchlogs-to-docker && ./result/bin/load-crossplane-aws-cloudwatchlogs-to-docker
```
