# opensearch-dashboards-3-fips-dashboards-query-workbench

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-dashboards-3-fips-dashboards-query-workbench

# Load into Docker
nix build .#load-opensearch-dashboards-3-fips-dashboards-query-workbench-to-docker && ./result/bin/load-opensearch-dashboards-3-fips-dashboards-query-workbench-to-docker
```
