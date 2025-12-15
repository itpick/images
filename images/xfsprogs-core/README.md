# xfsprogs-core

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#xfsprogs-core

# Load into Docker
nix build .#load-xfsprogs-core-to-docker && ./result/bin/load-xfsprogs-core-to-docker
```
