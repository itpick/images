# hadolint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 128.12 MB |
| Uncompressed | ~320.31 MB |

## Usage

```bash
# Build the image
nix build .#hadolint

# Load into Docker
nix build .#load-hadolint-to-docker && ./result/bin/load-hadolint-to-docker
```
