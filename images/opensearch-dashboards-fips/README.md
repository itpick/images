# opensearch-dashboards-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-dashboards-fips

# Load into Docker
nix build .#load-opensearch-dashboards-fips-to-docker && ./result/bin/load-opensearch-dashboards-fips-to-docker
```
