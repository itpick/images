# librechat-fips

A FIPS-compliant AI chat application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#librechat-fips

# Load into Docker
nix build .#load-librechat-fips-to-docker && ./result/bin/load-librechat-fips-to-docker
```
