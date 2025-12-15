# yace-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yace-fips

# Load into Docker
nix build .#load-yace-fips-to-docker && ./result/bin/load-yace-fips-to-docker
```
