# k3s-multicall

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k3s-multicall

# Load into Docker
nix build .#load-k3s-multicall-to-docker && ./result/bin/load-k3s-multicall-to-docker
```
