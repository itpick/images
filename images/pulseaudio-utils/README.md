# pulseaudio-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulseaudio-utils

# Load into Docker
nix build .#load-pulseaudio-utils-to-docker && ./result/bin/load-pulseaudio-utils-to-docker
```
