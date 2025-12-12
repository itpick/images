# grafana-alloy

OpenTelemetry Collector distribution with programmable pipelines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 987.47 MB |
| Uncompressed | ~2.41 GB |

## Usage

```bash
# Build the image
nix build .#grafana-alloy

# Load into Docker
nix build .#load-grafana-alloy-to-docker && ./result/bin/load-grafana-alloy-to-docker
```
