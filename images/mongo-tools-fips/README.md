# mongo-tools-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongo-tools-fips

# Load into Docker
nix build .#load-mongo-tools-fips-to-docker && ./result/bin/load-mongo-tools-fips-to-docker
```
