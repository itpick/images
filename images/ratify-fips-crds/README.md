# ratify-fips-crds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-fips-crds

# Load into Docker
nix build .#load-ratify-fips-crds-to-docker && ./result/bin/load-ratify-fips-crds-to-docker
```
