# sgdisk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sgdisk

# Load into Docker
nix build .#load-sgdisk-to-docker && ./result/bin/load-sgdisk-to-docker
```
