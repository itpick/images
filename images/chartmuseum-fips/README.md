# chartmuseum-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chartmuseum-fips

# Load into Docker
nix build .#load-chartmuseum-fips-to-docker && ./result/bin/load-chartmuseum-fips-to-docker
```
