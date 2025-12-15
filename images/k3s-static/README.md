# k3s-static

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k3s-static

# Load into Docker
nix build .#load-k3s-static-to-docker && ./result/bin/load-k3s-static-to-docker
```
