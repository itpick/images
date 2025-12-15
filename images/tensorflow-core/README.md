# tensorflow-core

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tensorflow-core

# Load into Docker
nix build .#load-tensorflow-core-to-docker && ./result/bin/load-tensorflow-core-to-docker
```
