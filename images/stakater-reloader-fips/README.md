# stakater-reloader-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#stakater-reloader-fips

# Load into Docker
nix build .#load-stakater-reloader-fips-to-docker && ./result/bin/load-stakater-reloader-fips-to-docker
```
