# nodetaint

Minimal nodetaint container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nodetaint

# Load into Docker
nix build .#load-nodetaint-to-docker && ./result/bin/load-nodetaint-to-docker
```
