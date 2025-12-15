# cert-manager-controller-iamguarded

cert-manager is a tool for provisioning and managing TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-controller-iamguarded

# Load into Docker
nix build .#load-cert-manager-controller-iamguarded-to-docker && ./result/bin/load-cert-manager-controller-iamguarded-to-docker
```
