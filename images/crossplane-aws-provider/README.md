# crossplane-aws-provider

Crossplane provider-aws is the infrastructure provider for Amazon Web Services (AWS)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-provider

# Load into Docker
nix build .#load-crossplane-aws-provider-to-docker && ./result/bin/load-crossplane-aws-provider-to-docker
```
