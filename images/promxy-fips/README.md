# promxy-fips

Minimal image with Promxy, FIPS compliant

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promxy-fips

# Load into Docker
nix build .#load-promxy-fips-to-docker && ./result/bin/load-promxy-fips-to-docker
```
