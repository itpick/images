# mosquitto

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mosquitto

# Load into Docker
nix build .#load-mosquitto-to-docker && ./result/bin/load-mosquitto-to-docker
```
