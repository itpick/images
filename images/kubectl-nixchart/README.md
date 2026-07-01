# kubectl-nixchart

Minimal image with kubectl binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-nixchart

# Load into Docker
nix build .#load-kubectl-nixchart-to-docker && ./result/bin/load-kubectl-nixchart-to-docker
```
