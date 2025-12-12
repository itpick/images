# cert-manager-acmesolver

Wolfi-based images for cert-manager, a tool for provisioning and managing TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 13s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 236.77 MB |
| Uncompressed | ~591.93 MB |

## Usage

```bash
# Build the image
nix build .#cert-manager-acmesolver

# Load into Docker
nix build .#load-cert-manager-acmesolver-to-docker && ./result/bin/load-cert-manager-acmesolver-to-docker
```
