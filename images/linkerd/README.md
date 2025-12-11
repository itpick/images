# linkerd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#linkerd

# Load into Docker
nix build .#load-linkerd-to-docker && ./result/bin/load-linkerd-to-docker
```
