# victoriametrics-vminsert

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-vminsert

# Load into Docker
nix build .#load-victoriametrics-vminsert-to-docker && ./result/bin/load-victoriametrics-vminsert-to-docker
```
