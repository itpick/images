# sigstore-scaffolding-rekor-createsecret-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-rekor-createsecret-fips

# Load into Docker
nix build .#load-sigstore-scaffolding-rekor-createsecret-fips-to-docker && ./result/bin/load-sigstore-scaffolding-rekor-createsecret-fips-to-docker
```
