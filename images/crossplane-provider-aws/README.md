# crossplane-provider-aws

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-aws

# Load into Docker
nix build .#load-crossplane-provider-aws-to-docker && ./result/bin/load-crossplane-provider-aws-to-docker
```
