# linkerd2-proxy-identity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-proxy-identity

# Load into Docker
nix build .#load-linkerd2-proxy-identity-to-docker && ./result/bin/load-linkerd2-proxy-identity-to-docker
```
