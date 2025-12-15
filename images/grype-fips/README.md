# grype-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grype-fips

# Load into Docker
nix build .#load-grype-fips-to-docker && ./result/bin/load-grype-fips-to-docker
```
