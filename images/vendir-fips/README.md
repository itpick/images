# vendir-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vendir-fips

# Load into Docker
nix build .#load-vendir-fips-to-docker && ./result/bin/load-vendir-fips-to-docker
```
