# gatekeeper

Minimal Gatekeeper image for enforcing Kubernetes policies using Open Policy Agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 229.42 MB |
| Uncompressed | ~573.55 MB |

## Usage

```bash
# Build the image
nix build .#gatekeeper

# Load into Docker
nix build .#load-gatekeeper-to-docker && ./result/bin/load-gatekeeper-to-docker
```
