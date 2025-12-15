# calico-whisker-backend-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-whisker-backend-fips

# Load into Docker
nix build .#load-calico-whisker-backend-fips-to-docker && ./result/bin/load-calico-whisker-backend-fips-to-docker
```
