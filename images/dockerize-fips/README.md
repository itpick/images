# dockerize-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dockerize-fips

# Load into Docker
nix build .#load-dockerize-fips-to-docker && ./result/bin/load-dockerize-fips-to-docker
```
