# xfsprogs-extra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#xfsprogs-extra

# Load into Docker
nix build .#load-xfsprogs-extra-to-docker && ./result/bin/load-xfsprogs-extra-to-docker
```
