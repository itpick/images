# metallb-frr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-frr

# Load into Docker
nix build .#load-metallb-frr-to-docker && ./result/bin/load-metallb-frr-to-docker
```
