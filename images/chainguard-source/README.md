# chainguard-source

Fetches all sources referenced by a Chainguard Package or Image SBOM

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chainguard-source

# Load into Docker
nix build .#load-chainguard-source-to-docker && ./result/bin/load-chainguard-source-to-docker
```
