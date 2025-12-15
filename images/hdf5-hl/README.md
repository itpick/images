# hdf5-hl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hdf5-hl

# Load into Docker
nix build .#load-hdf5-hl-to-docker && ./result/bin/load-hdf5-hl-to-docker
```
