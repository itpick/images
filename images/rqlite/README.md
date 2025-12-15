# rqlite

Minimal image with rqlite

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rqlite

# Load into Docker
nix build .#load-rqlite-to-docker && ./result/bin/load-rqlite-to-docker
```
