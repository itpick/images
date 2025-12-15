# py3-pip-wheel

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#py3-pip-wheel

# Load into Docker
nix build .#load-py3-pip-wheel-to-docker && ./result/bin/load-py3-pip-wheel-to-docker
```
