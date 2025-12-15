# age-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#age-fips

# Load into Docker
nix build .#load-age-fips-to-docker && ./result/bin/load-age-fips-to-docker
```
