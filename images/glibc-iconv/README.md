# glibc-iconv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#glibc-iconv

# Load into Docker
nix build .#load-glibc-iconv-to-docker && ./result/bin/load-glibc-iconv-to-docker
```
