# llvm-lld

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#llvm-lld

# Load into Docker
nix build .#load-llvm-lld-to-docker && ./result/bin/load-llvm-lld-to-docker
```
