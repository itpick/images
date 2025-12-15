# kube-webhook-certgen

Generates certificates and updates Kubernetes webhooks, integrating with Helm to simplify Kubernetes job execution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kube-webhook-certgen

# Load into Docker
nix build .#load-kube-webhook-certgen-to-docker && ./result/bin/load-kube-webhook-certgen-to-docker
```
