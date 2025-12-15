# pypy

PyPy is a fast and compliant implementation of the Python language

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pypy

# Load into Docker
nix build .#load-pypy-to-docker && ./result/bin/load-pypy-to-docker
```
