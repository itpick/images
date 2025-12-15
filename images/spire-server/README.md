# spire-server

Minimalist Wolfi-based spire images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spire-server

# Load into Docker
nix build .#load-spire-server-to-docker && ./result/bin/load-spire-server-to-docker
```
