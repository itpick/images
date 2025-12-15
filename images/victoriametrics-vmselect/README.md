# victoriametrics-vmselect

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-vmselect

# Load into Docker
nix build .#load-victoriametrics-vmselect-to-docker && ./result/bin/load-victoriametrics-vmselect-to-docker
```
