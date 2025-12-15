# calico-csi

Calico is a networking and security solution that enables Kubernetes workloads and non-Kubernetes/legacy workloads to communicate seamlessly and securely

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-csi

# Load into Docker
nix build .#load-calico-csi-to-docker && ./result/bin/load-calico-csi-to-docker
```
