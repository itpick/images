# rancher-hardened-kubernetes-compat-fips

FIPS-compliant Kubernetes components compatible with Rancher's RKE2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-hardened-kubernetes-compat-fips

# Load into Docker
nix build .#load-rancher-hardened-kubernetes-compat-fips-to-docker && ./result/bin/load-rancher-hardened-kubernetes-compat-fips-to-docker
```
