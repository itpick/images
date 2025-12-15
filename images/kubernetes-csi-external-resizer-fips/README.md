# kubernetes-csi-external-resizer-fips

Minimal image with kubernetes-csi/external-resizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-resizer-fips

# Load into Docker
nix build .#load-kubernetes-csi-external-resizer-fips-to-docker && ./result/bin/load-kubernetes-csi-external-resizer-fips-to-docker
```
