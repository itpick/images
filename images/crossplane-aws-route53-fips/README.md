# crossplane-aws-route53-fips

FIPS-compliant Crossplane providers for managing Amazon Web Services (AWS) services on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-route53-fips

# Load into Docker
nix build .#load-crossplane-aws-route53-fips-to-docker && ./result/bin/load-crossplane-aws-route53-fips-to-docker
```
