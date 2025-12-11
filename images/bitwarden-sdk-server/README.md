# bitwarden-sdk-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 15s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#bitwarden-sdk-server

# Load into Docker
nix build .#load-bitwarden-sdk-server-to-docker && ./result/bin/load-bitwarden-sdk-server-to-docker
```
