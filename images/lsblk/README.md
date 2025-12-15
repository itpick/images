# lsblk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lsblk

# Load into Docker
nix build .#load-lsblk-to-docker && ./result/bin/load-lsblk-to-docker
```
