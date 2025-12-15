# k8s-device-plugin-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-device-plugin-fips

# Load into Docker
nix build .#load-k8s-device-plugin-fips-to-docker && ./result/bin/load-k8s-device-plugin-fips-to-docker
```
