# wasmer

This image contains the wasmer tool which can be used to compile or run wasm binaries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wasmer

# Load into Docker
nix build .#load-wasmer-to-docker && ./result/bin/load-wasmer-to-docker
```
