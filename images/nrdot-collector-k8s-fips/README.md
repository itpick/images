# nrdot-collector-k8s-fips

New Relic .NET collector for Kubernetes monitoring

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nrdot-collector-k8s-fips

# Load into Docker
nix build .#load-nrdot-collector-k8s-fips-to-docker && ./result/bin/load-nrdot-collector-k8s-fips-to-docker
```
