# cluster-api-helm-controller

CAAPH uses Helm charts to manage the installation and lifecycle of Cluster API add-ons

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-helm-controller

# Load into Docker
nix build .#load-cluster-api-helm-controller-to-docker && ./result/bin/load-cluster-api-helm-controller-to-docker
```
