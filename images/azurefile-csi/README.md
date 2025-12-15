# azurefile-csi

This driver allows Kubernetes to access Azure File volume using smb and nfs protocols, csi plugin name: file.csi.azure.com

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azurefile-csi

# Load into Docker
nix build .#load-azurefile-csi-to-docker && ./result/bin/load-azurefile-csi-to-docker
```
