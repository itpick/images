# nri-mssql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mssql

# Load into Docker
nix build .#load-nri-mssql-to-docker && ./result/bin/load-nri-mssql-to-docker
```
