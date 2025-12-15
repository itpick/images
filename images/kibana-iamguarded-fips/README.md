# kibana-iamguarded-fips

Your window into the Elastic Stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kibana-iamguarded-fips

# Load into Docker
nix build .#load-kibana-iamguarded-fips-to-docker && ./result/bin/load-kibana-iamguarded-fips-to-docker
```
