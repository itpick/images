# linkerd2-web

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-web

# Load into Docker
nix build .#load-linkerd2-web-to-docker && ./result/bin/load-linkerd2-web-to-docker
```
