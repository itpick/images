# gops-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gops-fips

# Load into Docker
nix build .#load-gops-fips-to-docker && ./result/bin/load-gops-fips-to-docker
```
