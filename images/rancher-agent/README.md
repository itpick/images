# rancher-agent

The Rancher Agent is responsible for communicating between the managed Kubernetes clusters and the Rancher server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-agent

# Load into Docker
nix build .#load-rancher-agent-to-docker && ./result/bin/load-rancher-agent-to-docker
```
