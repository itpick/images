# rtorrent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rtorrent

# Load into Docker
nix build .#load-rtorrent-to-docker && ./result/bin/load-rtorrent-to-docker
```
