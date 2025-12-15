# agentbeat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#agentbeat

# Load into Docker
nix build .#load-agentbeat-to-docker && ./result/bin/load-agentbeat-to-docker
```
