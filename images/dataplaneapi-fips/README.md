# dataplaneapi-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dataplaneapi-fips

# Load into Docker
nix build .#load-dataplaneapi-fips-to-docker && ./result/bin/load-dataplaneapi-fips-to-docker
```
