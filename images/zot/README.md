# zot

Minimal image with zot binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zot

# Load into Docker
nix build .#load-zot-to-docker && ./result/bin/load-zot-to-docker
```
