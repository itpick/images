# kubectl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kubectl

# Load into Docker
nix build .#load-kubectl-to-docker && ./result/bin/load-kubectl-to-docker
```
