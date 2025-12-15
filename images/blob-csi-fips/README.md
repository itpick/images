# blob-csi-fips

This driver allows Kubernetes to access Azure Storage via azure-storage-fuse & NFSv3

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#blob-csi-fips

# Load into Docker
nix build .#load-blob-csi-fips-to-docker && ./result/bin/load-blob-csi-fips-to-docker
```
