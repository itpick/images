# linkerd2-debug

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-debug

# Load into Docker
nix build .#load-linkerd2-debug-to-docker && ./result/bin/load-linkerd2-debug-to-docker
```
