# cpp-runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cpp-runtime

# Load into Docker
nix build .#load-cpp-runtime-to-docker && ./result/bin/load-cpp-runtime-to-docker
```
