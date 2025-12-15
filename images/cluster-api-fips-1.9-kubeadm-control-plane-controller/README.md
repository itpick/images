# cluster-api-fips-1.9-kubeadm-control-plane-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-fips-1.9-kubeadm-control-plane-controller

# Load into Docker
nix build .#load-cluster-api-fips-1.9-kubeadm-control-plane-controller-to-docker && ./result/bin/load-cluster-api-fips-1.9-kubeadm-control-plane-controller-to-docker
```
