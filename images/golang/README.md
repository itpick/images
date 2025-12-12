# golang

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 860.48 MB |
| Uncompressed | ~2.10 GB |

## Usage

```bash
# Build the image
nix build .#golang

# Load into Docker
nix build .#load-golang-to-docker && ./result/bin/load-golang-to-docker
```
