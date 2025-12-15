# wavefront-proxy

Minimal wavefront-proxy image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wavefront-proxy

# Load into Docker
nix build .#load-wavefront-proxy-to-docker && ./result/bin/load-wavefront-proxy-to-docker
```
