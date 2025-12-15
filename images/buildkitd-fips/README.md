# buildkitd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#buildkitd-fips

# Load into Docker
nix build .#load-buildkitd-fips-to-docker && ./result/bin/load-buildkitd-fips-to-docker
```
