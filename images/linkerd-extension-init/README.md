# linkerd-extension-init

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-extension-init

# Load into Docker
nix build .#load-linkerd-extension-init-to-docker && ./result/bin/load-linkerd-extension-init-to-docker
```
