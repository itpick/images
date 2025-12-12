# nix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 186.55 MB |
| Uncompressed | ~466.39 MB |

## Usage

```bash
# Build the image
nix build .#nix

# Load into Docker
nix build .#load-nix-to-docker && ./result/bin/load-nix-to-docker
```
