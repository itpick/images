# grafana-beyla

Open source eBPF-based auto-instrumentation tool that helps you easily get started with application observability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-beyla

# Load into Docker
nix build .#load-grafana-beyla-to-docker && ./result/bin/load-grafana-beyla-to-docker
```
