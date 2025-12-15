# dockerd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dockerd-fips

# Load into Docker
nix build .#load-dockerd-fips-to-docker && ./result/bin/load-dockerd-fips-to-docker
```
