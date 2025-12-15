# datadog-agent-s6-overlay-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-agent-s6-overlay-fips

# Load into Docker
nix build .#load-datadog-agent-s6-overlay-fips-to-docker && ./result/bin/load-datadog-agent-s6-overlay-fips-to-docker
```
