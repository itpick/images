# kubernetes-helm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kubernetes-helm

# Load into Docker
nix build .#load-kubernetes-helm-to-docker && ./result/bin/load-kubernetes-helm-to-docker
```
