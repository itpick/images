# kapp-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kapp-fips

# Load into Docker
nix build .#load-kapp-fips-to-docker && ./result/bin/load-kapp-fips-to-docker
```
