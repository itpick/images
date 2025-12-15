# skaffold

Minimal container image for running skaffold apps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#skaffold

# Load into Docker
nix build .#load-skaffold-to-docker && ./result/bin/load-skaffold-to-docker
```
