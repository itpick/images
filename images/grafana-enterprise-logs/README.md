# grafana-enterprise-logs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#grafana-enterprise-logs

# Load into Docker
nix build .#load-grafana-enterprise-logs-to-docker && ./result/bin/load-grafana-enterprise-logs-to-docker
```
