# vc-webhook-manager

A Kubernetes-native batch scheduling system, extending and enhancing the capabilities of the standard kube-scheduler

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vc-webhook-manager

# Load into Docker
nix build .#load-vc-webhook-manager-to-docker && ./result/bin/load-vc-webhook-manager-to-docker
```
