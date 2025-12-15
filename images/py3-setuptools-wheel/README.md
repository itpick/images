# py3-setuptools-wheel

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#py3-setuptools-wheel

# Load into Docker
nix build .#load-py3-setuptools-wheel-to-docker && ./result/bin/load-py3-setuptools-wheel-to-docker
```
