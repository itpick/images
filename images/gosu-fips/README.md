# gosu-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gosu-fips

# Load into Docker
nix build .#load-gosu-fips-to-docker && ./result/bin/load-gosu-fips-to-docker
```
