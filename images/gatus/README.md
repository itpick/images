# gatus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 161.50 MB |
| Uncompressed | ~403.75 MB |

## Usage

```bash
# Build the image
nix build .#gatus

# Load into Docker
nix build .#load-gatus-to-docker && ./result/bin/load-gatus-to-docker
```
