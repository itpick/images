# rancher-fleet-agent

Deploy workloads from Git to large fleets of Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet-agent

# Load into Docker
nix build .#load-rancher-fleet-agent-to-docker && ./result/bin/load-rancher-fleet-agent-to-docker
```
