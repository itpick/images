# metrics-agent-fips

metrics-agent collects Kubernetes allocation and utilization data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metrics-agent-fips

# Load into Docker
nix build .#load-metrics-agent-fips-to-docker && ./result/bin/load-metrics-agent-fips-to-docker
```
