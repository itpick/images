# cloudwatch-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloudwatch-exporter

# Load into Docker
nix build .#load-cloudwatch-exporter-to-docker && ./result/bin/load-cloudwatch-exporter-to-docker
```
