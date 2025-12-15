# kube-bench-configs-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-bench-configs-fips

# Load into Docker
nix build .#load-kube-bench-configs-fips-to-docker && ./result/bin/load-kube-bench-configs-fips-to-docker
```
