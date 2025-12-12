# go

Container image for building Go applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 860.48 MB |
| Uncompressed | ~2.10 GB |

## Usage

```bash
# Build the image
nix build .#go

# Load into Docker
nix build .#load-go-to-docker && ./result/bin/load-go-to-docker
```
