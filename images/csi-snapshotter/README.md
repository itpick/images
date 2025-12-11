# csi-snapshotter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 12s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#csi-snapshotter

# Load into Docker
nix build .#load-csi-snapshotter-to-docker && ./result/bin/load-csi-snapshotter-to-docker
```
