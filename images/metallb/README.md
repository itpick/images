# metallb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb

# Load into Docker
nix build .#load-metallb-to-docker && ./result/bin/load-metallb-to-docker
```
