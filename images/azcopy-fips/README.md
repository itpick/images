# azcopy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azcopy-fips

# Load into Docker
nix build .#load-azcopy-fips-to-docker && ./result/bin/load-azcopy-fips-to-docker
```
