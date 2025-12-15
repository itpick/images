# ctr-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ctr-fips

# Load into Docker
nix build .#load-ctr-fips-to-docker && ./result/bin/load-ctr-fips-to-docker
```
