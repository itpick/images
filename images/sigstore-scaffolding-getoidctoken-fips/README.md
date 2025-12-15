# sigstore-scaffolding-getoidctoken-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-getoidctoken-fips

# Load into Docker
nix build .#load-sigstore-scaffolding-getoidctoken-fips-to-docker && ./result/bin/load-sigstore-scaffolding-getoidctoken-fips-to-docker
```
