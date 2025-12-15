# tkn-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tkn-fips

# Load into Docker
nix build .#load-tkn-fips-to-docker && ./result/bin/load-tkn-fips-to-docker
```
