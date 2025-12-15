# metrics-agent

metrics-agent collects Kubernetes allocation and utilization data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metrics-agent

# Load into Docker
nix build .#load-metrics-agent-to-docker && ./result/bin/load-metrics-agent-to-docker
```
