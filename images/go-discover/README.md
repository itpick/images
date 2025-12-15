# go-discover

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-discover

# Load into Docker
nix build .#load-go-discover-to-docker && ./result/bin/load-go-discover-to-docker
```
