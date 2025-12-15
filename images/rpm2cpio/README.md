# rpm2cpio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rpm2cpio

# Load into Docker
nix build .#load-rpm2cpio-to-docker && ./result/bin/load-rpm2cpio-to-docker
```
