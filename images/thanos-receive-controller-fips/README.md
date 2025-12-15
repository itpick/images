# thanos-receive-controller-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-receive-controller-fips

# Load into Docker
nix build .#load-thanos-receive-controller-fips-to-docker && ./result/bin/load-thanos-receive-controller-fips-to-docker
```
