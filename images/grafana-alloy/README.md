# grafana-alloy

OpenTelemetry Collector distribution with programmable pipelines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#grafana-alloy

# Load into Docker
nix build .#load-grafana-alloy-to-docker && ./result/bin/load-grafana-alloy-to-docker
```
