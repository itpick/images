# kbld-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kbld-fips

# Load into Docker
nix build .#load-kbld-fips-to-docker && ./result/bin/load-kbld-fips-to-docker
```
