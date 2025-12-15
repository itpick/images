# gitness

Minimal image with the gitness server application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitness

# Load into Docker
nix build .#load-gitness-to-docker && ./result/bin/load-gitness-to-docker
```
