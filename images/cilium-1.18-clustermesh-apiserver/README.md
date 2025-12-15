# cilium-1.18-clustermesh-apiserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-1.18-clustermesh-apiserver

# Load into Docker
nix build .#load-cilium-1.18-clustermesh-apiserver-to-docker && ./result/bin/load-cilium-1.18-clustermesh-apiserver-to-docker
```
