# flux-helm-controller-iamguarded-fips

minimal zero CVE flux images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-helm-controller-iamguarded-fips

# Load into Docker
nix build .#load-flux-helm-controller-iamguarded-fips-to-docker && ./result/bin/load-flux-helm-controller-iamguarded-fips-to-docker
```
