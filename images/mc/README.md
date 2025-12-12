# mc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 181.42 MB |
| Uncompressed | ~453.57 MB |

## Usage

```bash
# Build the image
nix build .#mc

# Load into Docker
nix build .#load-mc-to-docker && ./result/bin/load-mc-to-docker
```
