# kubectl-latest

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-latest

# Load into Docker
nix build .#load-kubectl-latest-to-docker && ./result/bin/load-kubectl-latest-to-docker
```
