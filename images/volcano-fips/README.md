# volcano-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volcano-fips

# Load into Docker
nix build .#load-volcano-fips-to-docker && ./result/bin/load-volcano-fips-to-docker
```
