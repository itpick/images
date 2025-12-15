# datadog-agent-core-integrations

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-agent-core-integrations

# Load into Docker
nix build .#load-datadog-agent-core-integrations-to-docker && ./result/bin/load-datadog-agent-core-integrations-to-docker
```
