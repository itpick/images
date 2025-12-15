# cilium-fips-1.18-host-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-fips-1.18-host-utils

# Load into Docker
nix build .#load-cilium-fips-1.18-host-utils-to-docker && ./result/bin/load-cilium-fips-1.18-host-utils-to-docker
```
