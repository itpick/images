# jdk-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jdk-fips

# Load into Docker
nix build .#load-jdk-fips-to-docker && ./result/bin/load-jdk-fips-to-docker
```
