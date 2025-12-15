# crossplane-aws-s3

Crossplane provider for managing Amazon Web Services (AWS) config services in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-s3

# Load into Docker
nix build .#load-crossplane-aws-s3-to-docker && ./result/bin/load-crossplane-aws-s3-to-docker
```
