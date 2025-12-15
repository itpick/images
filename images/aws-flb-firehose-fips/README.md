# aws-flb-firehose-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-flb-firehose-fips

# Load into Docker
nix build .#load-aws-flb-firehose-fips-to-docker && ./result/bin/load-aws-flb-firehose-fips-to-docker
```
