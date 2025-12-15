# kubernetes-csi-external-resizer

Minimal image with kubernetes-csi/external-resizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-resizer

# Load into Docker
nix build .#load-kubernetes-csi-external-resizer-to-docker && ./result/bin/load-kubernetes-csi-external-resizer-to-docker
```
