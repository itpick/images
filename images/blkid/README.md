# blkid

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#blkid

# Load into Docker
nix build .#load-blkid-to-docker && ./result/bin/load-blkid-to-docker
```
