# volume-modifier-for-k8s-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volume-modifier-for-k8s-fips

# Load into Docker
nix build .#load-volume-modifier-for-k8s-fips-to-docker && ./result/bin/load-volume-modifier-for-k8s-fips-to-docker
```
