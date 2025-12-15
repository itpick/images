# crossplane-provider-gcp-compute-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-gcp-compute-fips

# Load into Docker
nix build .#load-crossplane-provider-gcp-compute-fips-to-docker && ./result/bin/load-crossplane-provider-gcp-compute-fips-to-docker
```
