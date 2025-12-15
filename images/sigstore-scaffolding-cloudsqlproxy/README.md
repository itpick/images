# sigstore-scaffolding-cloudsqlproxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-cloudsqlproxy

# Load into Docker
nix build .#load-sigstore-scaffolding-cloudsqlproxy-to-docker && ./result/bin/load-sigstore-scaffolding-cloudsqlproxy-to-docker
```
