# kube-bench-configs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-bench-configs

# Load into Docker
nix build .#load-kube-bench-configs-to-docker && ./result/bin/load-kube-bench-configs-to-docker
```
