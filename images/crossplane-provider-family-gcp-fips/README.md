# crossplane-provider-family-gcp-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-family-gcp-fips

# Load into Docker
nix build .#load-crossplane-provider-family-gcp-fips-to-docker && ./result/bin/load-crossplane-provider-family-gcp-fips-to-docker
```
