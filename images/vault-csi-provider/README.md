# vault-csi-provider

HashiCorp Vault Provider for Secret Store CSI Driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#vault-csi-provider

# Load into Docker
nix build .#load-vault-csi-provider-to-docker && ./result/bin/load-vault-csi-provider-to-docker
```
