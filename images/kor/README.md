# kor

A Golang Tool to discover unused Kubernetes Resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kor

# Load into Docker
nix build .#load-kor-to-docker && ./result/bin/load-kor-to-docker
```
