# cachix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 181.64 MB |
| Uncompressed | ~454.10 MB |

## Usage

```bash
# Build the image
nix build .#cachix

# Load into Docker
nix build .#load-cachix-to-docker && ./result/bin/load-cachix-to-docker
```
