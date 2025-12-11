# windows-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#windows-exporter

# Load into Docker
nix build .#load-windows-exporter-to-docker && ./result/bin/load-windows-exporter-to-docker
```
