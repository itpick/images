# kubectl-fips-1.34-default

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-fips-1.34-default

# Load into Docker
nix build .#load-kubectl-fips-1.34-default-to-docker && ./result/bin/load-kubectl-fips-1.34-default-to-docker
```
