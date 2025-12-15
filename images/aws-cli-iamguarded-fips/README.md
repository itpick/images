# aws-cli-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-cli-iamguarded-fips

# Load into Docker
nix build .#load-aws-cli-iamguarded-fips-to-docker && ./result/bin/load-aws-cli-iamguarded-fips-to-docker
```
