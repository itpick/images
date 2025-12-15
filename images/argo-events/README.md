# argo-events

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-events

# Load into Docker
nix build .#load-argo-events-to-docker && ./result/bin/load-argo-events-to-docker
```
