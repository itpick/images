# crossplane-provider-aws-eks-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-aws-eks-fips

# Load into Docker
nix build .#load-crossplane-provider-aws-eks-fips-to-docker && ./result/bin/load-crossplane-provider-aws-eks-fips-to-docker
```
