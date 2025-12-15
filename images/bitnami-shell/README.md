# bitnami-shell

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#bitnami-shell

# Load into Docker
nix build .#load-bitnami-shell-to-docker && ./result/bin/load-bitnami-shell-to-docker
```
