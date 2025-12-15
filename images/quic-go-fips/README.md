# quic-go-fips

A production-ready QUIC implementation in pure Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#quic-go-fips

# Load into Docker
nix build .#load-quic-go-fips-to-docker && ./result/bin/load-quic-go-fips-to-docker
```
