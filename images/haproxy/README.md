# haproxy

A minimal haproxy base image rebuilt every night from source

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#haproxy

# Load into Docker
nix build .#load-haproxy-to-docker && ./result/bin/load-haproxy-to-docker
```
