# vc-controller-manager

A Kubernetes-native batch scheduling system, extending and enhancing the capabilities of the standard kube-scheduler

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vc-controller-manager

# Load into Docker
nix build .#load-vc-controller-manager-to-docker && ./result/bin/load-vc-controller-manager-to-docker
```
