# openexr-libiex

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openexr-libiex

# Load into Docker
nix build .#load-openexr-libiex-to-docker && ./result/bin/load-openexr-libiex-to-docker
```
