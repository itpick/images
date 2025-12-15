# openvscode-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openvscode-server

# Load into Docker
nix build .#load-openvscode-server-to-docker && ./result/bin/load-openvscode-server-to-docker
```
