# glibc-dynamic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#glibc-dynamic

# Load into Docker
nix build .#load-glibc-dynamic-to-docker && ./result/bin/load-glibc-dynamic-to-docker
```
