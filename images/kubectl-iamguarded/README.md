# kubectl-iamguarded

Minimal image with kubectl binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-iamguarded

# Load into Docker
nix build .#load-kubectl-iamguarded-to-docker && ./result/bin/load-kubectl-iamguarded-to-docker
```
