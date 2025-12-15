# velero-plugin-for-microsoft-azure-fips

Velero plugin for Microsoft Azure that provides backup and restore functionality for Azure Blob Storage and Azure Disk snapshots

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-plugin-for-microsoft-azure-fips

# Load into Docker
nix build .#load-velero-plugin-for-microsoft-azure-fips-to-docker && ./result/bin/load-velero-plugin-for-microsoft-azure-fips-to-docker
```
