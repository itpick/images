# k8sgpt

Minimal k8sgpt container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 234.67 MB |
| Uncompressed | ~586.69 MB |

## Usage

```bash
# Build the image
nix build .#k8sgpt

# Load into Docker
nix build .#load-k8sgpt-to-docker && ./result/bin/load-k8sgpt-to-docker
```
