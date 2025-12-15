# cerbos-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cerbos-fips

# Load into Docker
nix build .#load-cerbos-fips-to-docker && ./result/bin/load-cerbos-fips-to-docker
```
