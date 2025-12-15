# kube-vip-cloud-provider

A general purpose cloud provider for kube-vip

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-vip-cloud-provider

# Load into Docker
nix build .#load-kube-vip-cloud-provider-to-docker && ./result/bin/load-kube-vip-cloud-provider-to-docker
```
