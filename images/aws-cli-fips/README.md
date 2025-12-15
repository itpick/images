# aws-cli-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-cli-fips

# Load into Docker
nix build .#load-aws-cli-fips-to-docker && ./result/bin/load-aws-cli-fips-to-docker
```
