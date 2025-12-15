# mps-control-daemon

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mps-control-daemon

# Load into Docker
nix build .#load-mps-control-daemon-to-docker && ./result/bin/load-mps-control-daemon-to-docker
```
