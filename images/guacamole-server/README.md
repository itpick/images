# guacamole-server

Minimal Guacamole server remote desktop gateway image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#guacamole-server

# Load into Docker
nix build .#load-guacamole-server-to-docker && ./result/bin/load-guacamole-server-to-docker
```
