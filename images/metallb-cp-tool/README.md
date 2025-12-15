# metallb-cp-tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-cp-tool

# Load into Docker
nix build .#load-metallb-cp-tool-to-docker && ./result/bin/load-metallb-cp-tool-to-docker
```
