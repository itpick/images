# openbao

Minimal image with OpenBao

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#openbao

# Load into Docker
nix build .#load-openbao-to-docker && ./result/bin/load-openbao-to-docker
```
