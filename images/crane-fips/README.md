# crane-fips

Minimalist Wolfi-based crane-fips image to interact with container registries. Crane is used for inspecting and manipulating container images, allowing you to view manifests, verify image layers, and check cryptographic signatures

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crane-fips

# Load into Docker
nix build .#load-crane-fips-to-docker && ./result/bin/load-crane-fips-to-docker
```
