# sonarr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sonarr

# Load into Docker
nix build .#load-sonarr-to-docker && ./result/bin/load-sonarr-to-docker
```
