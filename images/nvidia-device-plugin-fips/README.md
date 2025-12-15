# nvidia-device-plugin-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-device-plugin-fips

# Load into Docker
nix build .#load-nvidia-device-plugin-fips-to-docker && ./result/bin/load-nvidia-device-plugin-fips-to-docker
```
