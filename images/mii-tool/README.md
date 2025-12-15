# mii-tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mii-tool

# Load into Docker
nix build .#load-mii-tool-to-docker && ./result/bin/load-mii-tool-to-docker
```
