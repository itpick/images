# skopeo-fips

Minimalist Wolfi-based skopeo image for interacting with container registries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#skopeo-fips

# Load into Docker
nix build .#load-skopeo-fips-to-docker && ./result/bin/load-skopeo-fips-to-docker
```
