# syncthing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#syncthing

# Load into Docker
nix build .#load-syncthing-to-docker && ./result/bin/load-syncthing-to-docker
```
