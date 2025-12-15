# losetup

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#losetup

# Load into Docker
nix build .#load-losetup-to-docker && ./result/bin/load-losetup-to-docker
```
