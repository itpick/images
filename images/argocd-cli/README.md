# argocd-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 530.58 MB |
| Uncompressed | ~1.29 GB |

## Usage

```bash
# Build the image
nix build .#argocd-cli

# Load into Docker
nix build .#load-argocd-cli-to-docker && ./result/bin/load-argocd-cli-to-docker
```
