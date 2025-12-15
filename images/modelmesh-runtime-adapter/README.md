# modelmesh-runtime-adapter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#modelmesh-runtime-adapter

# Load into Docker
nix build .#load-modelmesh-runtime-adapter-to-docker && ./result/bin/load-modelmesh-runtime-adapter-to-docker
```
