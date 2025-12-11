# csi-attacher

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#csi-attacher

# Load into Docker
nix build .#load-csi-attacher-to-docker && ./result/bin/load-csi-attacher-to-docker
```
