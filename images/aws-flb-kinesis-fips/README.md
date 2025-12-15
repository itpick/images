# aws-flb-kinesis-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-flb-kinesis-fips

# Load into Docker
nix build .#load-aws-flb-kinesis-fips-to-docker && ./result/bin/load-aws-flb-kinesis-fips-to-docker
```
