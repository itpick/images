# elastic-agent-fips

Elastic Agent is a unified agent for collecting, monitoring, and securing data across systems in the Elastic Stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#elastic-agent-fips

# Load into Docker
nix build .#load-elastic-agent-fips-to-docker && ./result/bin/load-elastic-agent-fips-to-docker
```
