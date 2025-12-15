# python-3.14-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#python-3.14-base

# Load into Docker
nix build .#load-python-3.14-base-to-docker && ./result/bin/load-python-3.14-base-to-docker
```
