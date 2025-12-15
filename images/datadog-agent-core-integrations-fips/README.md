# datadog-agent-core-integrations-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-agent-core-integrations-fips

# Load into Docker
nix build .#load-datadog-agent-core-integrations-fips-to-docker && ./result/bin/load-datadog-agent-core-integrations-fips-to-docker
```
