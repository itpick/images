# linkerd2-cni-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-cni-plugin

# Load into Docker
nix build .#load-linkerd2-cni-plugin-to-docker && ./result/bin/load-linkerd2-cni-plugin-to-docker
```
