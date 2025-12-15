# cilium-envoy

Cilium-envoy is a specialized Envoy proxy used by Cilium for Layer 7 policy enforcement and service mesh functionality

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-envoy

# Load into Docker
nix build .#load-cilium-envoy-to-docker && ./result/bin/load-cilium-envoy-to-docker
```
