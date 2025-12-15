# flux-image-reflector-controller-iamguarded-fips

minimal zero CVE flux images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-image-reflector-controller-iamguarded-fips

# Load into Docker
nix build .#load-flux-image-reflector-controller-iamguarded-fips-to-docker && ./result/bin/load-flux-image-reflector-controller-iamguarded-fips-to-docker
```
