# conda-init

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conda-init

# Load into Docker
nix build .#load-conda-init-to-docker && ./result/bin/load-conda-init-to-docker
```
