# step-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-fips

# Load into Docker
nix build .#load-step-fips-to-docker && ./result/bin/load-step-fips-to-docker
```
