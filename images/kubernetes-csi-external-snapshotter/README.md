# kubernetes-csi-external-snapshotter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-snapshotter

# Load into Docker
nix build .#load-kubernetes-csi-external-snapshotter-to-docker && ./result/bin/load-kubernetes-csi-external-snapshotter-to-docker
```
