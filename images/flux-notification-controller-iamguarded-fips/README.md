# flux-notification-controller-iamguarded-fips

minimal zero CVE flux images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-notification-controller-iamguarded-fips

# Load into Docker
nix build .#load-flux-notification-controller-iamguarded-fips-to-docker && ./result/bin/load-flux-notification-controller-iamguarded-fips-to-docker
```
