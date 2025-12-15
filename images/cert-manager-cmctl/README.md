# cert-manager-cmctl

Wolfi-based images for cert-manager, a tool for provisioning and managing TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-cmctl

# Load into Docker
nix build .#load-cert-manager-cmctl-to-docker && ./result/bin/load-cert-manager-cmctl-to-docker
```
