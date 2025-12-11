# metrics-server

Metrics Server is a Kubernetes component that collects and provides resource usage metrics (CPU, memory) for nodes and pods

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 51s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#metrics-server

# Load into Docker
nix build .#load-metrics-server-to-docker && ./result/bin/load-metrics-server-to-docker
```
