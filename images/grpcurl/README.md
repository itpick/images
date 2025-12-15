# grpcurl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grpcurl

# Load into Docker
nix build .#load-grpcurl-to-docker && ./result/bin/load-grpcurl-to-docker
```
