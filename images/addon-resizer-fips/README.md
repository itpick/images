# addon-resizer-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#addon-resizer-fips

# Load into Docker
nix build .#load-addon-resizer-fips-to-docker && ./result/bin/load-addon-resizer-fips-to-docker
```
