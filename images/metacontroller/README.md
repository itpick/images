# metacontroller

Minimal Metacontroller Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metacontroller

# Load into Docker
nix build .#load-metacontroller-to-docker && ./result/bin/load-metacontroller-to-docker
```
