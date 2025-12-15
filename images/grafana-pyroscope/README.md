# grafana-pyroscope

Grafana Pyroscope is a continuous profiling platform that allows you to debug performance issues down to a single line of code

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-pyroscope

# Load into Docker
nix build .#load-grafana-pyroscope-to-docker && ./result/bin/load-grafana-pyroscope-to-docker
```
