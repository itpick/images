# chromium

Minimal Chromium container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#chromium

# Load into Docker
nix build .#load-chromium-to-docker && ./result/bin/load-chromium-to-docker
```
