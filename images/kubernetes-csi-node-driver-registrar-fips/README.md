# kubernetes-csi-node-driver-registrar-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-node-driver-registrar-fips

# Load into Docker
nix build .#load-kubernetes-csi-node-driver-registrar-fips-to-docker && ./result/bin/load-kubernetes-csi-node-driver-registrar-fips-to-docker
```
