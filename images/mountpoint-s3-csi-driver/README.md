# mountpoint-s3-csi-driver

Built on Mountpoint for Amazon S3, the Mountpoint CSI driver presents an Amazon S3 bucket as a storage volume accessible by containers in your Kubernetes cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mountpoint-s3-csi-driver

# Load into Docker
nix build .#load-mountpoint-s3-csi-driver-to-docker && ./result/bin/load-mountpoint-s3-csi-driver-to-docker
```
