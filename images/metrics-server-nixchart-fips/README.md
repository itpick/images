# metrics-server-nixchart-fips

Metrics Server is a Kubernetes component that collects and provides resource usage metrics (CPU, memory) for nodes and pods

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metrics-server-nixchart-fips

# Load into Docker
nix build .#load-metrics-server-nixchart-fips-to-docker && ./result/bin/load-metrics-server-nixchart-fips-to-docker
```
