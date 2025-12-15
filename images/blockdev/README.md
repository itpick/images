# blockdev

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#blockdev

# Load into Docker
nix build .#load-blockdev-to-docker && ./result/bin/load-blockdev-to-docker
```
