# ini-file-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ini-file-fips

# Load into Docker
nix build .#load-ini-file-fips-to-docker && ./result/bin/load-ini-file-fips-to-docker
```
