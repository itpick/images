# yunikorn-web

Apache YuniKorn Web UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yunikorn-web

# Load into Docker
nix build .#load-yunikorn-web-to-docker && ./result/bin/load-yunikorn-web-to-docker
```
