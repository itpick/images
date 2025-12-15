# kube-state-metrics-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics-fips

# Load into Docker
nix build .#load-kube-state-metrics-fips-to-docker && ./result/bin/load-kube-state-metrics-fips-to-docker
```
