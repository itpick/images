# cilium-envoy-fips

Cilium-envoy-fips is a FIPS 140-3 compliant, specialized Envoy proxy used by Cilium for Layer 7 policy enforcement and service mesh functionality

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-envoy-fips

# Load into Docker
nix build .#load-cilium-envoy-fips-to-docker && ./result/bin/load-cilium-envoy-fips-to-docker
```
