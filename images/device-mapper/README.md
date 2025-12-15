# device-mapper

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#device-mapper

# Load into Docker
nix build .#load-device-mapper-to-docker && ./result/bin/load-device-mapper-to-docker
```
