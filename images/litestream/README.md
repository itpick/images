# litestream

Container image for litestream, to replicate SQLite databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#litestream

# Load into Docker
nix build .#load-litestream-to-docker && ./result/bin/load-litestream-to-docker
```
