# anchore-enterprise

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 333.49 MB |
| Uncompressed | ~833.72 MB |

## Usage

```bash
# Build the image
nix build .#anchore-enterprise

# Load into Docker
nix build .#load-anchore-enterprise-to-docker && ./result/bin/load-anchore-enterprise-to-docker
```
