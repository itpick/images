# spire-controller-manager-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spire-controller-manager-fips

# Load into Docker
nix build .#load-spire-controller-manager-fips-to-docker && ./result/bin/load-spire-controller-manager-fips-to-docker
```
