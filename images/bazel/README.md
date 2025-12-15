# bazel

Bazel - A fast, scalable, multi-language and extensible build system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bazel

# Load into Docker
nix build .#load-bazel-to-docker && ./result/bin/load-bazel-to-docker
```
