# pypiserver

Minimal PyPI server for uploading & downloading packages with pip/easy_install

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pypiserver

# Load into Docker
nix build .#load-pypiserver-to-docker && ./result/bin/load-pypiserver-to-docker
```
