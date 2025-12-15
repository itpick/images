# containerd-shim-runc-v2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd-shim-runc-v2

# Load into Docker
nix build .#load-containerd-shim-runc-v2-to-docker && ./result/bin/load-containerd-shim-runc-v2-to-docker
```
