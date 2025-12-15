# conda

This image contains the CLI for the Conda programming environment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conda

# Load into Docker
nix build .#load-conda-to-docker && ./result/bin/load-conda-to-docker
```
