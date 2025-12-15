# kube-state-metrics-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-state-metrics-iamguarded-fips

# Load into Docker
nix build .#load-kube-state-metrics-iamguarded-fips-to-docker && ./result/bin/load-kube-state-metrics-iamguarded-fips-to-docker
```
