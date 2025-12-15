# calico-kube-controllers-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-kube-controllers-fips

# Load into Docker
nix build .#load-calico-kube-controllers-fips-to-docker && ./result/bin/load-calico-kube-controllers-fips-to-docker
```
