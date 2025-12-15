# quic-go-client-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#quic-go-client-fips

# Load into Docker
nix build .#load-quic-go-client-fips-to-docker && ./result/bin/load-quic-go-client-fips-to-docker
```
