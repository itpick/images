# kyverno-pre-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-pre-fips

# Load into Docker
nix build .#load-kyverno-pre-fips-to-docker && ./result/bin/load-kyverno-pre-fips-to-docker
```
