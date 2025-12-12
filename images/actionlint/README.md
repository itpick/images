# actionlint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 262.01 MB |
| Uncompressed | ~655.02 MB |

## Usage

```bash
# Build the image
nix build .#actionlint

# Load into Docker
nix build .#load-actionlint-to-docker && ./result/bin/load-actionlint-to-docker
```
