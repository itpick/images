# temporal-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-fips

# Load into Docker
nix build .#load-temporal-fips-to-docker && ./result/bin/load-temporal-fips-to-docker
```
