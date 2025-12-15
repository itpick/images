# aznfs-mount

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aznfs-mount

# Load into Docker
nix build .#load-aznfs-mount-to-docker && ./result/bin/load-aznfs-mount-to-docker
```
