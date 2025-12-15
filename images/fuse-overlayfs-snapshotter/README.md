# fuse-overlayfs-snapshotter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fuse-overlayfs-snapshotter

# Load into Docker
nix build .#load-fuse-overlayfs-snapshotter-to-docker && ./result/bin/load-fuse-overlayfs-snapshotter-to-docker
```
