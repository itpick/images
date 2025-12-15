# kube-apiserver-fips-1.34-default

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-apiserver-fips-1.34-default

# Load into Docker
nix build .#load-kube-apiserver-fips-1.34-default-to-docker && ./result/bin/load-kube-apiserver-fips-1.34-default-to-docker
```
