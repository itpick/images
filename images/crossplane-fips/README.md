# crossplane-fips

The Cloud Native Control Plane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-fips

# Load into Docker
nix build .#load-crossplane-fips-to-docker && ./result/bin/load-crossplane-fips-to-docker
```
