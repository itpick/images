# csi-resizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#csi-resizer

# Load into Docker
nix build .#load-csi-resizer-to-docker && ./result/bin/load-csi-resizer-to-docker
```
