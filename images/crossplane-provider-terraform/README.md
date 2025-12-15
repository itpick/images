# crossplane-provider-terraform

Crossplane Terraform Provider enables provisioning and managing infrastructure using Terraform within a Crossplane control plane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-terraform

# Load into Docker
nix build .#load-crossplane-provider-terraform-to-docker && ./result/bin/load-crossplane-provider-terraform-to-docker
```
