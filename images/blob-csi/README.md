# blob-csi

This driver allows Kubernetes to access Azure Storage via azure-storage-fuse & NFSv3

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#blob-csi

# Load into Docker
nix build .#load-blob-csi-to-docker && ./result/bin/load-blob-csi-to-docker
```
