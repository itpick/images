# podman-tui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#podman-tui

# Load into Docker
nix build .#load-podman-tui-to-docker && ./result/bin/load-podman-tui-to-docker
```
