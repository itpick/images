# cfssl-self-sign-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cfssl-self-sign-fips

# Load into Docker
nix build .#load-cfssl-self-sign-fips-to-docker && ./result/bin/load-cfssl-self-sign-fips-to-docker
```
