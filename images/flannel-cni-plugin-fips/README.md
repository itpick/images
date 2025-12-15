# flannel-cni-plugin-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flannel-cni-plugin-fips

# Load into Docker
nix build .#load-flannel-cni-plugin-fips-to-docker && ./result/bin/load-flannel-cni-plugin-fips-to-docker
```
