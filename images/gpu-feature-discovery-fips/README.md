# gpu-feature-discovery-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpu-feature-discovery-fips

# Load into Docker
nix build .#load-gpu-feature-discovery-fips-to-docker && ./result/bin/load-gpu-feature-discovery-fips-to-docker
```
