# ytt-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ytt-fips

# Load into Docker
nix build .#load-ytt-fips-to-docker && ./result/bin/load-ytt-fips-to-docker
```
