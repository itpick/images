# kyverno-cli-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-cli-fips

# Load into Docker
nix build .#load-kyverno-cli-fips-to-docker && ./result/bin/load-kyverno-cli-fips-to-docker
```
