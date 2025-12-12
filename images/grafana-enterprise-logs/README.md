# grafana-enterprise-logs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 661.77 MB |
| Uncompressed | ~1.61 GB |

## Usage

```bash
# Build the image
nix build .#grafana-enterprise-logs

# Load into Docker
nix build .#load-grafana-enterprise-logs-to-docker && ./result/bin/load-grafana-enterprise-logs-to-docker
```
