# pgpool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 144.33 MB |
| Uncompressed | ~360.83 MB |

## Usage

```bash
# Build the image
nix build .#pgpool

# Load into Docker
nix build .#load-pgpool-to-docker && ./result/bin/load-pgpool-to-docker
```
