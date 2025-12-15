# istio-pilot-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-pilot-agent

# Load into Docker
nix build .#load-istio-pilot-agent-to-docker && ./result/bin/load-istio-pilot-agent-to-docker
```
