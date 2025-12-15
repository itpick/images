# haproxy-iamguarded

A minimal haproxy base image rebuilt every night from source

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#haproxy-iamguarded

# Load into Docker
nix build .#load-haproxy-iamguarded-to-docker && ./result/bin/load-haproxy-iamguarded-to-docker
```
