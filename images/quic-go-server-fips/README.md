# quic-go-server-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#quic-go-server-fips

# Load into Docker
nix build .#load-quic-go-server-fips-to-docker && ./result/bin/load-quic-go-server-fips-to-docker
```
