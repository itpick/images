# argo-workflows

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 523.39 MB |
| Uncompressed | ~1.27 GB |

## Usage

```bash
# Build the image
nix build .#argo-workflows

# Load into Docker
nix build .#load-argo-workflows-to-docker && ./result/bin/load-argo-workflows-to-docker
```
