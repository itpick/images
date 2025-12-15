# influxd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#influxd

# Load into Docker
nix build .#load-influxd-to-docker && ./result/bin/load-influxd-to-docker
```
