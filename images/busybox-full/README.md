# busybox-full

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#busybox-full

# Load into Docker
nix build .#load-busybox-full-to-docker && ./result/bin/load-busybox-full-to-docker
```
