# grpc-health-probe

A tool to perform health-checks for gRPC applications in Kubernetes and elsewhere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 75.23 MB |
| Uncompressed | ~188.07 MB |

## Usage

```bash
# Build the image
nix build .#grpc-health-probe

# Load into Docker
nix build .#load-grpc-health-probe-to-docker && ./result/bin/load-grpc-health-probe-to-docker
```
