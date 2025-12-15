# crossplane-aws-kinesis

Crossplane provider for managing Amazon Web Services (AWS) config services in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-kinesis

# Load into Docker
nix build .#load-crossplane-aws-kinesis-to-docker && ./result/bin/load-crossplane-aws-kinesis-to-docker
```
