# trillian-logsigner-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trillian-logsigner-fips

# Load into Docker
nix build .#load-trillian-logsigner-fips-to-docker && ./result/bin/load-trillian-logsigner-fips-to-docker
```
