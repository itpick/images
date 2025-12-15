# kube-apiserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-apiserver

# Load into Docker
nix build .#load-kube-apiserver-to-docker && ./result/bin/load-kube-apiserver-to-docker
```
