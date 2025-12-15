# grpc-health-probe-fips

A tool to perform health-checks for gRPC applications in Kubernetes and elsewhere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grpc-health-probe-fips

# Load into Docker
nix build .#load-grpc-health-probe-fips-to-docker && ./result/bin/load-grpc-health-probe-fips-to-docker
```
