# nix-unstable

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 187.20 MB |
| Uncompressed | ~468.01 MB |

## Usage

```bash
# Build the image
nix build .#nix-unstable

# Load into Docker
nix build .#load-nix-unstable-to-docker && ./result/bin/load-nix-unstable-to-docker
```
