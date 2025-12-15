# tomcat-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tomcat-fips

# Load into Docker
nix build .#load-tomcat-fips-to-docker && ./result/bin/load-tomcat-fips-to-docker
```
