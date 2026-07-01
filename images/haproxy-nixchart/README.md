# haproxy-nixchart

A minimal haproxy base image rebuilt every night from source

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#haproxy-nixchart

# Load into Docker
nix build .#load-haproxy-nixchart-to-docker && ./result/bin/load-haproxy-nixchart-to-docker
```
