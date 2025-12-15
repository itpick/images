# ffmpeg-cuda-7.1-nozeromq

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ffmpeg-cuda-7.1-nozeromq

# Load into Docker
nix build .#load-ffmpeg-cuda-7.1-nozeromq-to-docker && ./result/bin/load-ffmpeg-cuda-7.1-nozeromq-to-docker
```
