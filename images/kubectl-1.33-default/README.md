# kubectl-1.33-default

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-1.33-default

# Load into Docker
nix build .#load-kubectl-1.33-default-to-docker && ./result/bin/load-kubectl-1.33-default-to-docker
```
