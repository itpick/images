# bank-vaults-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bank-vaults-fips

# Load into Docker
nix build .#load-bank-vaults-fips-to-docker && ./result/bin/load-bank-vaults-fips-to-docker
```
