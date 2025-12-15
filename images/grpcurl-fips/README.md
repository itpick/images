# grpcurl-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grpcurl-fips

# Load into Docker
nix build .#load-grpcurl-fips-to-docker && ./result/bin/load-grpcurl-fips-to-docker
```
