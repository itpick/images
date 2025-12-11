# ffmpeg

Minimal image that contains ffmpeg

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ffmpeg

# Load into Docker
nix build .#load-ffmpeg-to-docker && ./result/bin/load-ffmpeg-to-docker
```
