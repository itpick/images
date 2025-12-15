# containerd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd

# Load into Docker
nix build .#load-containerd-to-docker && ./result/bin/load-containerd-to-docker
```
