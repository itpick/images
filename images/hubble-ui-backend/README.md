# hubble-ui-backend

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 171.09 MB |
| Uncompressed | ~427.73 MB |

## Usage

```bash
# Build the image
nix build .#hubble-ui-backend

# Load into Docker
nix build .#load-hubble-ui-backend-to-docker && ./result/bin/load-hubble-ui-backend-to-docker
```
