# cni-plugins-fips-loopback

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins-fips-loopback

# Load into Docker
nix build .#load-cni-plugins-fips-loopback-to-docker && ./result/bin/load-cni-plugins-fips-loopback-to-docker
```
