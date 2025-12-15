# radarr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#radarr

# Load into Docker
nix build .#load-radarr-to-docker && ./result/bin/load-radarr-to-docker
```
