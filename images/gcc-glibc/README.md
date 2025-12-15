# gcc-glibc

Minimal GCC (GNU Compiler Collection) image for building C applications compatible with glibc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gcc-glibc

# Load into Docker
nix build .#load-gcc-glibc-to-docker && ./result/bin/load-gcc-glibc-to-docker
```
