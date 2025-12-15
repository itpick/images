# aws-flb-cloudwatch-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-flb-cloudwatch-fips

# Load into Docker
nix build .#load-aws-flb-cloudwatch-fips-to-docker && ./result/bin/load-aws-flb-cloudwatch-fips-to-docker
```
