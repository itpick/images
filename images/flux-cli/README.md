# flux-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 306.07 MB |
| Uncompressed | ~765.18 MB |

## Usage

```bash
# Build the image
nix build .#flux-cli

# Load into Docker
nix build .#load-flux-cli-to-docker && ./result/bin/load-flux-cli-to-docker
```
