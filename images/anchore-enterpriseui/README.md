# anchore-enterpriseui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 208.21 MB |
| Uncompressed | ~520.54 MB |

## Usage

```bash
# Build the image
nix build .#anchore-enterpriseui

# Load into Docker
nix build .#load-anchore-enterpriseui-to-docker && ./result/bin/load-anchore-enterpriseui-to-docker
```
