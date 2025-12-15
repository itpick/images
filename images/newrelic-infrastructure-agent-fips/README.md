# newrelic-infrastructure-agent-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-infrastructure-agent-fips

# Load into Docker
nix build .#load-newrelic-infrastructure-agent-fips-to-docker && ./result/bin/load-newrelic-infrastructure-agent-fips-to-docker
```
