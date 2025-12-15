# opensearch-dashboards-3-fips-dashboards-reporting

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-dashboards-3-fips-dashboards-reporting

# Load into Docker
nix build .#load-opensearch-dashboards-3-fips-dashboards-reporting-to-docker && ./result/bin/load-opensearch-dashboards-3-fips-dashboards-reporting-to-docker
```
