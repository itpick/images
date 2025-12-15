# bank-vaults-template-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bank-vaults-template-fips

# Load into Docker
nix build .#load-bank-vaults-template-fips-to-docker && ./result/bin/load-bank-vaults-template-fips-to-docker
```
