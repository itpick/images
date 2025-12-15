# opensearch-dashboards

Minimal image with OpenSearch Dashboards

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-dashboards

# Load into Docker
nix build .#load-opensearch-dashboards-to-docker && ./result/bin/load-opensearch-dashboards-to-docker
```
