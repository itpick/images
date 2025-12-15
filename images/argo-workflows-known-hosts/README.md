# argo-workflows-known-hosts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflows-known-hosts

# Load into Docker
nix build .#load-argo-workflows-known-hosts-to-docker && ./result/bin/load-argo-workflows-known-hosts-to-docker
```
