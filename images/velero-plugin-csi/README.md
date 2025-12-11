# velero-plugin-csi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#velero-plugin-csi

# Load into Docker
nix build .#load-velero-plugin-csi-to-docker && ./result/bin/load-velero-plugin-csi-to-docker
```
