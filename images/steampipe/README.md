# steampipe

Steampipe is the zero-ETL way to query APIs and services, used to expose data sources to SQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#steampipe

# Load into Docker
nix build .#load-steampipe-to-docker && ./result/bin/load-steampipe-to-docker
```
