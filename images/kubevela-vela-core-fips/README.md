# kubevela-vela-core-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubevela-vela-core-fips

# Load into Docker
nix build .#load-kubevela-vela-core-fips-to-docker && ./result/bin/load-kubevela-vela-core-fips-to-docker
```
