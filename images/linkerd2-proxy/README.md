# linkerd2-proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-proxy

# Load into Docker
nix build .#load-linkerd2-proxy-to-docker && ./result/bin/load-linkerd2-proxy-to-docker
```
