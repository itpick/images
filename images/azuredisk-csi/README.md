# azuredisk-csi

The Azure Disk CSI driver enables the provisioning and management of Azure Disks through Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azuredisk-csi

# Load into Docker
nix build .#load-azuredisk-csi-to-docker && ./result/bin/load-azuredisk-csi-to-docker
```
