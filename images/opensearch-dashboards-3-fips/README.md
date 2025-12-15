# opensearch-dashboards-3-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-dashboards-3-fips

# Load into Docker
nix build .#load-opensearch-dashboards-3-fips-to-docker && ./result/bin/load-opensearch-dashboards-3-fips-to-docker
```
