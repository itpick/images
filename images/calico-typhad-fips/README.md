# calico-typhad-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-typhad-fips

# Load into Docker
nix build .#load-calico-typhad-fips-to-docker && ./result/bin/load-calico-typhad-fips-to-docker
```
