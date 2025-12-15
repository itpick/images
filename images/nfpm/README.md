# nfpm

nFPM is Not FPM - a simple deb, rpm, apk, ipk, and arch linux packager written in Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nfpm

# Load into Docker
nix build .#load-nfpm-to-docker && ./result/bin/load-nfpm-to-docker
```
