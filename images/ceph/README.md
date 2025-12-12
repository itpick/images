# ceph

Ceph is a distributed object, block, and file storage platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 39s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.13 GB |
| Uncompressed | ~5.34 GB |

## Usage

```bash
# Build the image
nix build .#ceph

# Load into Docker
nix build .#load-ceph-to-docker && ./result/bin/load-ceph-to-docker
```
