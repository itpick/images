# rancher-fleet

Deploy workloads from Git to large fleets of Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet

# Load into Docker
nix build .#load-rancher-fleet-to-docker && ./result/bin/load-rancher-fleet-to-docker
```
