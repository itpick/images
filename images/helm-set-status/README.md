# helm-set-status

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-set-status

# Load into Docker
nix build .#load-helm-set-status-to-docker && ./result/bin/load-helm-set-status-to-docker
```
