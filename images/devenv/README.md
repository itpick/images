# devenv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 309.72 MB |
| Uncompressed | ~774.31 MB |

## Usage

```bash
# Build the image
nix build .#devenv

# Load into Docker
nix build .#load-devenv-to-docker && ./result/bin/load-devenv-to-docker
```
