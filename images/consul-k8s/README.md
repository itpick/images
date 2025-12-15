# consul-k8s

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#consul-k8s

# Load into Docker
nix build .#load-consul-k8s-to-docker && ./result/bin/load-consul-k8s-to-docker
```
