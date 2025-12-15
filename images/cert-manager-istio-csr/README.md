# cert-manager-istio-csr

istio-csr is an agent that allows for Istio workload and control plane components to be secured using cert-manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-istio-csr

# Load into Docker
nix build .#load-cert-manager-istio-csr-to-docker && ./result/bin/load-cert-manager-istio-csr-to-docker
```
