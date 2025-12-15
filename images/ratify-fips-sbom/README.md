# ratify-fips-sbom

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-fips-sbom

# Load into Docker
nix build .#load-ratify-fips-sbom-to-docker && ./result/bin/load-ratify-fips-sbom-to-docker
```
