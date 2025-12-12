# alertmanager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 189.55 MB |
| Uncompressed | ~473.88 MB |

## Usage

```bash
# Build the image
nix build .#alertmanager

# Load into Docker
nix build .#load-alertmanager-to-docker && ./result/bin/load-alertmanager-to-docker
```
