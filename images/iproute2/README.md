# iproute2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#iproute2

# Load into Docker
nix build .#load-iproute2-to-docker && ./result/bin/load-iproute2-to-docker
```
