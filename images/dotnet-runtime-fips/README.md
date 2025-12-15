# dotnet-runtime-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-runtime-fips

# Load into Docker
nix build .#load-dotnet-runtime-fips-to-docker && ./result/bin/load-dotnet-runtime-fips-to-docker
```
