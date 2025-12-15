# pdns-recursor-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pdns-recursor-fips

# Load into Docker
nix build .#load-pdns-recursor-fips-to-docker && ./result/bin/load-pdns-recursor-fips-to-docker
```
