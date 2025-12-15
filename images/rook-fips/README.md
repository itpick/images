# rook-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rook-fips

# Load into Docker
nix build .#load-rook-fips-to-docker && ./result/bin/load-rook-fips-to-docker
```
