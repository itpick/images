# devcontainer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 19s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.45 GB |
| Uncompressed | ~3.64 GB |

## Usage

```bash
# Build the image
nix build .#devcontainer

# Load into Docker
nix build .#load-devcontainer-to-docker && ./result/bin/load-devcontainer-to-docker
```
