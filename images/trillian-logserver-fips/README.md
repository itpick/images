# trillian-logserver-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trillian-logserver-fips

# Load into Docker
nix build .#load-trillian-logserver-fips-to-docker && ./result/bin/load-trillian-logserver-fips-to-docker
```
