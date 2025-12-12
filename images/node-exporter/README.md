# node-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 126.73 MB |
| Uncompressed | ~316.83 MB |

## Usage

```bash
# Build the image
nix build .#node-exporter

# Load into Docker
nix build .#load-node-exporter-to-docker && ./result/bin/load-node-exporter-to-docker
```
