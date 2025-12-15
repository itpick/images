# ant-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ant-fips

# Load into Docker
nix build .#load-ant-fips-to-docker && ./result/bin/load-ant-fips-to-docker
```
