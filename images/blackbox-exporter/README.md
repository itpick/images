# blackbox-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 136.15 MB |
| Uncompressed | ~340.37 MB |

## Usage

```bash
# Build the image
nix build .#blackbox-exporter

# Load into Docker
nix build .#load-blackbox-exporter-to-docker && ./result/bin/load-blackbox-exporter-to-docker
```
