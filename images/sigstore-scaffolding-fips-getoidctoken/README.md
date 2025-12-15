# sigstore-scaffolding-fips-getoidctoken

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-getoidctoken

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-getoidctoken-to-docker && ./result/bin/load-sigstore-scaffolding-fips-getoidctoken-to-docker
```
