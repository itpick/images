# cluster-api-ipam-provider-in-cluster

An IPAM provider for Cluster API that manages pools of IP addresses using Kubernetes resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-ipam-provider-in-cluster

# Load into Docker
nix build .#load-cluster-api-ipam-provider-in-cluster-to-docker && ./result/bin/load-cluster-api-ipam-provider-in-cluster-to-docker
```
