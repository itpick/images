# kubelet-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubelet-fips

# Load into Docker
nix build .#load-kubelet-fips-to-docker && ./result/bin/load-kubelet-fips-to-docker
```
