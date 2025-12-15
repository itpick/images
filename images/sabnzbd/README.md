# sabnzbd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sabnzbd

# Load into Docker
nix build .#load-sabnzbd-to-docker && ./result/bin/load-sabnzbd-to-docker
```
