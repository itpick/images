# kube-proxy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-proxy-fips

# Load into Docker
nix build .#load-kube-proxy-fips-to-docker && ./result/bin/load-kube-proxy-fips-to-docker
```
