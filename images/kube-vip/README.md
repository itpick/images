# kube-vip

Kubernetes Control Plane Virtual IP and Load-Balancer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-vip

# Load into Docker
nix build .#load-kube-vip-to-docker && ./result/bin/load-kube-vip-to-docker
```
