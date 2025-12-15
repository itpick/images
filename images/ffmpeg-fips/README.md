# ffmpeg-fips

Minimal image that contains ffmpeg

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ffmpeg-fips

# Load into Docker
nix build .#load-ffmpeg-fips-to-docker && ./result/bin/load-ffmpeg-fips-to-docker
```
