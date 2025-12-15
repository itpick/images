# crossplane-provider-aws-eks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-aws-eks

# Load into Docker
nix build .#load-crossplane-provider-aws-eks-to-docker && ./result/bin/load-crossplane-provider-aws-eks-to-docker
```
