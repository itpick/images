# secrets-store-csi-driver-provider-azure

Azure Key Vault provider for Secret Store CSI driver allows you to get secret contents stored in Azure Key Vault instance and use the Secret Store CSI driver interface to mount them into Kubernetes pods

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-provider-azure

# Load into Docker
nix build .#load-secrets-store-csi-driver-provider-azure-to-docker && ./result/bin/load-secrets-store-csi-driver-provider-azure-to-docker
```
