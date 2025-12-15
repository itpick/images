# kubernetes-reflector-fips

Kubernetes controller for reflecting ConfigMaps, Secrets, and Certificates across namespaces

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-reflector-fips

# Load into Docker
nix build .#load-kubernetes-reflector-fips-to-docker && ./result/bin/load-kubernetes-reflector-fips-to-docker
```
