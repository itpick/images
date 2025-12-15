# buildctl-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#buildctl-fips

# Load into Docker
nix build .#load-buildctl-fips-to-docker && ./result/bin/load-buildctl-fips-to-docker
```
