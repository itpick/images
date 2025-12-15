# crossplane-aws-provider-fips

Crossplane provider-aws is the infrastructure provider for Amazon Web Services (AWS)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-provider-fips

# Load into Docker
nix build .#load-crossplane-aws-provider-fips-to-docker && ./result/bin/load-crossplane-aws-provider-fips-to-docker
```
