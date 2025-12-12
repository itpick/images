# loki-helm-test

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 660.38 MB |
| Uncompressed | ~1.61 GB |

## Usage

```bash
# Build the image
nix build .#loki-helm-test

# Load into Docker
nix build .#load-loki-helm-test-to-docker && ./result/bin/load-loki-helm-test-to-docker
```
