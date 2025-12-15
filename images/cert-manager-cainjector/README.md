# cert-manager-cainjector

Wolfi-based images for cert-manager, a tool for provisioning and managing TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cert-manager-cainjector

# Load into Docker
nix build .#load-cert-manager-cainjector-to-docker && ./result/bin/load-cert-manager-cainjector-to-docker
```
