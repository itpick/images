# agentbeat-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#agentbeat-fips

# Load into Docker
nix build .#load-agentbeat-fips-to-docker && ./result/bin/load-agentbeat-fips-to-docker
```
