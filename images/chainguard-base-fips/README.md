# chainguard-base-fips

Minimal, FIPS-validated image useful as a base for building secure images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chainguard-base-fips

# Load into Docker
nix build .#load-chainguard-base-fips-to-docker && ./result/bin/load-chainguard-base-fips-to-docker
```
