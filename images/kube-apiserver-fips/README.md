# kube-apiserver-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-apiserver-fips

# Load into Docker
nix build .#load-kube-apiserver-fips-to-docker && ./result/bin/load-kube-apiserver-fips-to-docker
```
