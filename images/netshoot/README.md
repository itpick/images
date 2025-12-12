# netshoot

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 264.18 MB |
| Uncompressed | ~660.47 MB |

## Usage

```bash
# Build the image
nix build .#netshoot

# Load into Docker
nix build .#load-netshoot-to-docker && ./result/bin/load-netshoot-to-docker
```
