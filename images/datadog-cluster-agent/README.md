# datadog-cluster-agent

Minimalist Wolfi-based Datadog Agent to collect events and metrics from hosts and send them to Datadog

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-cluster-agent

# Load into Docker
nix build .#load-datadog-cluster-agent-to-docker && ./result/bin/load-datadog-cluster-agent-to-docker
```
