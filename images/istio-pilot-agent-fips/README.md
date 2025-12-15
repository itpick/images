# istio-pilot-agent-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-pilot-agent-fips

# Load into Docker
nix build .#load-istio-pilot-agent-fips-to-docker && ./result/bin/load-istio-pilot-agent-fips-to-docker
```
