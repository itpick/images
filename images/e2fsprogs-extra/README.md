# e2fsprogs-extra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#e2fsprogs-extra

# Load into Docker
nix build .#load-e2fsprogs-extra-to-docker && ./result/bin/load-e2fsprogs-extra-to-docker
```
