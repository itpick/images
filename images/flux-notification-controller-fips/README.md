# flux-notification-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-notification-controller-fips

# Load into Docker
nix build .#load-flux-notification-controller-fips-to-docker && ./result/bin/load-flux-notification-controller-fips-to-docker
```
