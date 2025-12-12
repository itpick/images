# chisel

A fast TCP/UDP tunnel over HTTP

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 123.59 MB |
| Uncompressed | ~308.98 MB |

## Usage

```bash
# Build the image
nix build .#chisel

# Load into Docker
nix build .#load-chisel-to-docker && ./result/bin/load-chisel-to-docker
```
