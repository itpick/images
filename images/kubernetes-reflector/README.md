# kubernetes-reflector

Kubernetes controller for reflecting ConfigMaps, Secrets, and Certificates across namespaces

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 185.95 MB |
| Uncompressed | ~464.89 MB |

## Usage

```bash
# Build the image
nix build .#kubernetes-reflector

# Load into Docker
nix build .#load-kubernetes-reflector-to-docker && ./result/bin/load-kubernetes-reflector-to-docker
```
