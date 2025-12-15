# cloud-provider-aws-fips

Cloud provider for AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-aws-fips

# Load into Docker
nix build .#load-cloud-provider-aws-fips-to-docker && ./result/bin/load-cloud-provider-aws-fips-to-docker
```
