# kubernetes-release-go-runner-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-release-go-runner-fips

# Load into Docker
nix build .#load-kubernetes-release-go-runner-fips-to-docker && ./result/bin/load-kubernetes-release-go-runner-fips-to-docker
```
