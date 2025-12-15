# cert-manager-startupapicheck

Automatically provision and manage TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cert-manager-startupapicheck

# Load into Docker
nix build .#load-cert-manager-startupapicheck-to-docker && ./result/bin/load-cert-manager-startupapicheck-to-docker
```
