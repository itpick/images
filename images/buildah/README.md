# buildah

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#buildah

# Load into Docker
nix build .#load-buildah-to-docker && ./result/bin/load-buildah-to-docker
```
