# cc-dynamic

Base image with just enough to run arbitrary binaries that may require gcc or cc libraries, typically C++ or Rust binaries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cc-dynamic

# Load into Docker
nix build .#load-cc-dynamic-to-docker && ./result/bin/load-cc-dynamic-to-docker
```
