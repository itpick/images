# sigstore-scaffolding-tuf-createsecret

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-tuf-createsecret

# Load into Docker
nix build .#load-sigstore-scaffolding-tuf-createsecret-to-docker && ./result/bin/load-sigstore-scaffolding-tuf-createsecret-to-docker
```
