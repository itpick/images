# seaweedfs

SeaweedFS is a fast distributed storage system for blobs, objects, files, and data lake, providing S3-compatible API and filesystem interface

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#seaweedfs

# Load into Docker
nix build .#load-seaweedfs-to-docker && ./result/bin/load-seaweedfs-to-docker
```
