# yq-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yq-fips

# Load into Docker
nix build .#load-yq-fips-to-docker && ./result/bin/load-yq-fips-to-docker
```
