# wasmtime

This image contains the wasmtime tool which can be used to compile or run wasm binaries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wasmtime

# Load into Docker
nix build .#load-wasmtime-to-docker && ./result/bin/load-wasmtime-to-docker
```
