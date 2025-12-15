# crossplane-provider-family-aws-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-family-aws-fips

# Load into Docker
nix build .#load-crossplane-provider-family-aws-fips-to-docker && ./result/bin/load-crossplane-provider-family-aws-fips-to-docker
```
