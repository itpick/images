# dynamic-localpv-provisioner-fips

Minimal Fips image of Dynamic LocalPV Provisioner an Kubernetes component that automates the provisioning of local persistent volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dynamic-localpv-provisioner-fips

# Load into Docker
nix build .#load-dynamic-localpv-provisioner-fips-to-docker && ./result/bin/load-dynamic-localpv-provisioner-fips-to-docker
```
