# rook-ceph-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#rook-ceph-operator

# Load into Docker
nix build .#load-rook-ceph-operator-to-docker && ./result/bin/load-rook-ceph-operator-to-docker
```
