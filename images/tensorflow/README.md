# tensorflow

An Open Source Machine Learning Framework for Everyone

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tensorflow

# Load into Docker
nix build .#load-tensorflow-to-docker && ./result/bin/load-tensorflow-to-docker
```
