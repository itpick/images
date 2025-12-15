# kubectl-fips-latest

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-fips-latest

# Load into Docker
nix build .#load-kubectl-fips-latest-to-docker && ./result/bin/load-kubectl-fips-latest-to-docker
```
