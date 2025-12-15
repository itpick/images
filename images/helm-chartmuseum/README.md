# helm-chartmuseum

Minimal image with chartmuseum binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-chartmuseum

# Load into Docker
nix build .#load-helm-chartmuseum-to-docker && ./result/bin/load-helm-chartmuseum-to-docker
```
