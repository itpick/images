# gomplate-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gomplate-fips

# Load into Docker
nix build .#load-gomplate-fips-to-docker && ./result/bin/load-gomplate-fips-to-docker
```
