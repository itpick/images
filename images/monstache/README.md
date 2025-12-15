# monstache

A go daemon that syncs mongodb to elasticsearch in realtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#monstache

# Load into Docker
nix build .#load-monstache-to-docker && ./result/bin/load-monstache-to-docker
```
