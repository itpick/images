# ml-metadata-store-server

ML Metadata (MLMD) remote gRPC server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ml-metadata-store-server

# Load into Docker
nix build .#load-ml-metadata-store-server-to-docker && ./result/bin/load-ml-metadata-store-server-to-docker
```
