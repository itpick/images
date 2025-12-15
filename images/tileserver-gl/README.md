# tileserver-gl

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tileserver-gl

# Load into Docker
nix build .#load-tileserver-gl-to-docker && ./result/bin/load-tileserver-gl-to-docker
```
