# podman

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#podman

# Load into Docker
nix build .#load-podman-to-docker && ./result/bin/load-podman-to-docker
```
