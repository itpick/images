# owfs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#owfs

# Load into Docker
nix build .#load-owfs-to-docker && ./result/bin/load-owfs-to-docker
```
