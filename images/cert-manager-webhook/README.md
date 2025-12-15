# cert-manager-webhook

Wolfi-based images for cert-manager, a tool for provisioning and managing TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cert-manager-webhook

# Load into Docker
nix build .#load-cert-manager-webhook-to-docker && ./result/bin/load-cert-manager-webhook-to-docker
```
