# go-discover-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-discover-fips

# Load into Docker
nix build .#load-go-discover-fips-to-docker && ./result/bin/load-go-discover-fips-to-docker
```
