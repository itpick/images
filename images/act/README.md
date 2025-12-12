# act

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 130.03 MB |
| Uncompressed | ~325.07 MB |

## Usage

```bash
# Build the image
nix build .#act

# Load into Docker
nix build .#load-act-to-docker && ./result/bin/load-act-to-docker
```
