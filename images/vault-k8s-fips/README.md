# vault-k8s-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vault-k8s-fips

# Load into Docker
nix build .#load-vault-k8s-fips-to-docker && ./result/bin/load-vault-k8s-fips-to-docker
```
