# kubesec

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.17 MB |
| Uncompressed | ~295.43 MB |

## Usage

```bash
# Build the image
nix build .#kubesec

# Load into Docker
nix build .#load-kubesec-to-docker && ./result/bin/load-kubesec-to-docker
```
