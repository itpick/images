# cachix-flakes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 181.64 MB |
| Uncompressed | ~454.10 MB |

## Usage

```bash
# Build the image
nix build .#cachix-flakes

# Load into Docker
nix build .#load-cachix-flakes-to-docker && ./result/bin/load-cachix-flakes-to-docker
```
