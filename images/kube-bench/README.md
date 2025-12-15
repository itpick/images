# kube-bench

Minimal image with kube-bench

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kube-bench

# Load into Docker
nix build .#load-kube-bench-to-docker && ./result/bin/load-kube-bench-to-docker
```
