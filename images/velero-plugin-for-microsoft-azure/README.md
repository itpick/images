# velero-plugin-for-microsoft-azure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-plugin-for-microsoft-azure

# Load into Docker
nix build .#load-velero-plugin-for-microsoft-azure-to-docker && ./result/bin/load-velero-plugin-for-microsoft-azure-to-docker
```
