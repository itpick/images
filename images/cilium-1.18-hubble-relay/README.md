# cilium-1.18-hubble-relay

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-1.18-hubble-relay

# Load into Docker
nix build .#load-cilium-1.18-hubble-relay-to-docker && ./result/bin/load-cilium-1.18-hubble-relay-to-docker
```
