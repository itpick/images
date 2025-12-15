# cert-manager-startupapicheck-fips

Automatically provision and manage TLS certificates in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-startupapicheck-fips

# Load into Docker
nix build .#load-cert-manager-startupapicheck-fips-to-docker && ./result/bin/load-cert-manager-startupapicheck-fips-to-docker
```
