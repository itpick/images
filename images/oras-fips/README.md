# oras-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#oras-fips

# Load into Docker
nix build .#load-oras-fips-to-docker && ./result/bin/load-oras-fips-to-docker
```
