# syncthing-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#syncthing-fips

# Load into Docker
nix build .#load-syncthing-fips-to-docker && ./result/bin/load-syncthing-fips-to-docker
```
