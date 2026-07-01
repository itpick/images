# metrics-server-nixchart

Metrics Server is a Kubernetes component that collects and provides resource usage metrics (CPU, memory) for nodes and pods

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metrics-server-nixchart

# Load into Docker
nix build .#load-metrics-server-nixchart-to-docker && ./result/bin/load-metrics-server-nixchart-to-docker
```
