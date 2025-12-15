# kyverno-cleanup-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-cleanup-controller-fips

# Load into Docker
nix build .#load-kyverno-cleanup-controller-fips-to-docker && ./result/bin/load-kyverno-cleanup-controller-fips-to-docker
```
