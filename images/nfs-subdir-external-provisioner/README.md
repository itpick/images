# nfs-subdir-external-provisioner

Dynamic sub-dir volume provisioner on a remote NFS server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nfs-subdir-external-provisioner

# Load into Docker
nix build .#load-nfs-subdir-external-provisioner-to-docker && ./result/bin/load-nfs-subdir-external-provisioner-to-docker
```
