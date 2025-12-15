# linkerd-network-validator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-network-validator

# Load into Docker
nix build .#load-linkerd-network-validator-to-docker && ./result/bin/load-linkerd-network-validator-to-docker
```
