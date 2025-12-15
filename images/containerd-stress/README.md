# containerd-stress

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd-stress

# Load into Docker
nix build .#load-containerd-stress-to-docker && ./result/bin/load-containerd-stress-to-docker
```
