# rancher-fleet-agent-fips

Deploy workloads from Git to large fleets of Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet-agent-fips

# Load into Docker
nix build .#load-rancher-fleet-agent-fips-to-docker && ./result/bin/load-rancher-fleet-agent-fips-to-docker
```
