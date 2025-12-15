# spegel-fips

Stateless cluster local OCI registry mirror

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spegel-fips

# Load into Docker
nix build .#load-spegel-fips-to-docker && ./result/bin/load-spegel-fips-to-docker
```
