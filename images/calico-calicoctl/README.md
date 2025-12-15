# calico-calicoctl

Calico is a networking and security solution that enables Kubernetes workloads and non-Kubernetes/legacy workloads to communicate seamlessly and securely

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#calico-calicoctl

# Load into Docker
nix build .#load-calico-calicoctl-to-docker && ./result/bin/load-calico-calicoctl-to-docker
```
