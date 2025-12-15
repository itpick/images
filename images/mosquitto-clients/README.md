# mosquitto-clients

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mosquitto-clients

# Load into Docker
nix build .#load-mosquitto-clients-to-docker && ./result/bin/load-mosquitto-clients-to-docker
```
