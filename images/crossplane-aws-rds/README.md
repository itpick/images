# crossplane-aws-rds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-aws-rds

# Load into Docker
nix build .#load-crossplane-aws-rds-to-docker && ./result/bin/load-crossplane-aws-rds-to-docker
```
