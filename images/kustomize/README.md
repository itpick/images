# kustomize

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kustomize

# Load into Docker
nix build .#load-kustomize-to-docker && ./result/bin/load-kustomize-to-docker
```
