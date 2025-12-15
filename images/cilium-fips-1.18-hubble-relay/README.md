# cilium-fips-1.18-hubble-relay

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-fips-1.18-hubble-relay

# Load into Docker
nix build .#load-cilium-fips-1.18-hubble-relay-to-docker && ./result/bin/load-cilium-fips-1.18-hubble-relay-to-docker
```
