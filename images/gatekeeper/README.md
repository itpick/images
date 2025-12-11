# gatekeeper

Minimal Gatekeeper image for enforcing Kubernetes policies using Open Policy Agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gatekeeper

# Load into Docker
nix build .#load-gatekeeper-to-docker && ./result/bin/load-gatekeeper-to-docker
```
