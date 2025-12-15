# cilium-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-fips

# Load into Docker
nix build .#load-cilium-fips-to-docker && ./result/bin/load-cilium-fips-to-docker
```
