# linkerd-await

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-await

# Load into Docker
nix build .#load-linkerd-await-to-docker && ./result/bin/load-linkerd-await-to-docker
```
