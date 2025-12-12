# bitnami-shell

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.36 MB |
| Uncompressed | ~295.92 MB |

## Usage

```bash
# Build the image
nix build .#bitnami-shell

# Load into Docker
nix build .#load-bitnami-shell-to-docker && ./result/bin/load-bitnami-shell-to-docker
```
