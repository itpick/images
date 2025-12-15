# quic-go

A production-ready QUIC implementation in pure Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#quic-go

# Load into Docker
nix build .#load-quic-go-to-docker && ./result/bin/load-quic-go-to-docker
```
