# jellyfin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 14s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#jellyfin

# Load into Docker
nix build .#load-jellyfin-to-docker && ./result/bin/load-jellyfin-to-docker
```
