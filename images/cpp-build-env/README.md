# cpp-build-env

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cpp-build-env

# Load into Docker
nix build .#load-cpp-build-env-to-docker && ./result/bin/load-cpp-build-env-to-docker
```
