# az-iamguarded-fips

Azure CLI (IAM Guarded, FIPS)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#az-iamguarded-fips

# Load into Docker
nix build .#load-az-iamguarded-fips-to-docker && ./result/bin/load-az-iamguarded-fips-to-docker
```
