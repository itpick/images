# azuredisk-csi-fips

The Azure Disk CSI driver enables the provisioning and management of Azure Disks through Kubernetes.This driver provides an interface for attaching, detaching, and managing persistent disks on Azure, helping applications achieve durable and high-performing storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azuredisk-csi-fips

# Load into Docker
nix build .#load-azuredisk-csi-fips-to-docker && ./result/bin/load-azuredisk-csi-fips-to-docker
```
