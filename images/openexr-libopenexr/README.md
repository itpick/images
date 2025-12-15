# openexr-libopenexr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openexr-libopenexr

# Load into Docker
nix build .#load-openexr-libopenexr-to-docker && ./result/bin/load-openexr-libopenexr-to-docker
```
