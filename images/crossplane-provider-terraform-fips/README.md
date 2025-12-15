# crossplane-provider-terraform-fips

Minimal Fips image of Crossplane Terraform Provider enables provisioning and managing infrastructure using Terraform within a Crossplane control plane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-terraform-fips

# Load into Docker
nix build .#load-crossplane-provider-terraform-fips-to-docker && ./result/bin/load-crossplane-provider-terraform-fips-to-docker
```
