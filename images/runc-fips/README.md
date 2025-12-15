# runc-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#runc-fips

# Load into Docker
nix build .#load-runc-fips-to-docker && ./result/bin/load-runc-fips-to-docker
```
