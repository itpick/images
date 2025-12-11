# velero-plugin-azure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#velero-plugin-azure

# Load into Docker
nix build .#load-velero-plugin-azure-to-docker && ./result/bin/load-velero-plugin-azure-to-docker
```
