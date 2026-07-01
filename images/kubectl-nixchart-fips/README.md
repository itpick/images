# kubectl-nixchart-fips

Minimal image with kubectl binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-nixchart-fips

# Load into Docker
nix build .#load-kubectl-nixchart-fips-to-docker && ./result/bin/load-kubectl-nixchart-fips-to-docker
```
