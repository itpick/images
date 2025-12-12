# nix-flakes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 186.55 MB |
| Uncompressed | ~466.39 MB |

## Usage

```bash
# Build the image
nix build .#nix-flakes

# Load into Docker
nix build .#load-nix-flakes-to-docker && ./result/bin/load-nix-flakes-to-docker
```
