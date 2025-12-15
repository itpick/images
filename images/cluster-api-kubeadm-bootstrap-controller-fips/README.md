# cluster-api-kubeadm-bootstrap-controller-fips

Home for Cluster API, a subproject of sig-cluster-lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-kubeadm-bootstrap-controller-fips

# Load into Docker
nix build .#load-cluster-api-kubeadm-bootstrap-controller-fips-to-docker && ./result/bin/load-cluster-api-kubeadm-bootstrap-controller-fips-to-docker
```
