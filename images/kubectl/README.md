# kubectl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 160.12 MB |
| Uncompressed | ~400.30 MB |

## Usage

```bash
# Build the image
nix build .#kubectl

# Load into Docker
nix build .#load-kubectl-to-docker && ./result/bin/load-kubectl-to-docker
```
