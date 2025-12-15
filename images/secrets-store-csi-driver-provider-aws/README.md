# secrets-store-csi-driver-provider-aws

The AWS provider for the Secrets Store CSI Driver allows you to fetch secrets from AWS Secrets Manager and AWS Systems Manager Parameter Store, and mount them into Kubernetes pods

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-provider-aws

# Load into Docker
nix build .#load-secrets-store-csi-driver-provider-aws-to-docker && ./result/bin/load-secrets-store-csi-driver-provider-aws-to-docker
```
