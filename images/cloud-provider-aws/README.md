# cloud-provider-aws

Cloud provider for AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-aws

# Load into Docker
nix build .#load-cloud-provider-aws-to-docker && ./result/bin/load-cloud-provider-aws-to-docker
```
