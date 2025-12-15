# influx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#influx

# Load into Docker
nix build .#load-influx-to-docker && ./result/bin/load-influx-to-docker
```
