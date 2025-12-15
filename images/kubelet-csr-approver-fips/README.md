# kubelet-csr-approver-fips

Kubernetes controller to enable automatic kubelet CSR validation after a series of (configurable) security checks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubelet-csr-approver-fips

# Load into Docker
nix build .#load-kubelet-csr-approver-fips-to-docker && ./result/bin/load-kubelet-csr-approver-fips-to-docker
```
