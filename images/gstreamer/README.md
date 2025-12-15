# gstreamer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gstreamer

# Load into Docker
nix build .#load-gstreamer-to-docker && ./result/bin/load-gstreamer-to-docker
```
