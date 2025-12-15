# smarter-device-manager-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#smarter-device-manager-fips

# Load into Docker
nix build .#load-smarter-device-manager-fips-to-docker && ./result/bin/load-smarter-device-manager-fips-to-docker
```
