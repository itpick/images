# kubernetes-csi-driver-nfs-fips

This driver allows Kubernetes to access an NFS server running on a Linux node. This image is FIPS compliant

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-driver-nfs-fips

# Load into Docker
nix build .#load-kubernetes-csi-driver-nfs-fips-to-docker && ./result/bin/load-kubernetes-csi-driver-nfs-fips-to-docker
```
