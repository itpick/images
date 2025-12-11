# datadog-agent

Minimalist Wolfi-based Datadog Agent to collect events and metrics from hosts and send them to Datadog

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#datadog-agent

# Load into Docker
nix build .#load-datadog-agent-to-docker && ./result/bin/load-datadog-agent-to-docker
```
