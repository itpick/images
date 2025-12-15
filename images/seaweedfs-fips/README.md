# seaweedfs-fips

SeaweedFS is a fast distributed storage system for blobs, objects, files, and data lake, providing S3-compatible API and filesystem interface

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#seaweedfs-fips

# Load into Docker
nix build .#load-seaweedfs-fips-to-docker && ./result/bin/load-seaweedfs-fips-to-docker
```
