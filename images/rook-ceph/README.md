# rook-ceph

Storage Orchestration for Kubernetes. This is specifically for the Rook Ceph operator, which provides storage solutions for Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rook-ceph

# Load into Docker
nix build .#load-rook-ceph-to-docker && ./result/bin/load-rook-ceph-to-docker
```
