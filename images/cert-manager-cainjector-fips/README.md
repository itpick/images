# cert-manager-cainjector-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-cainjector-fips

# Load into Docker
nix build .#load-cert-manager-cainjector-fips-to-docker && ./result/bin/load-cert-manager-cainjector-fips-to-docker
```
