# newrelic-infrastructure-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-infrastructure-agent

# Load into Docker
nix build .#load-newrelic-infrastructure-agent-to-docker && ./result/bin/load-newrelic-infrastructure-agent-to-docker
```
