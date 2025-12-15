# openssl-provider-legacy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssl-provider-legacy

# Load into Docker
nix build .#load-openssl-provider-legacy-to-docker && ./result/bin/load-openssl-provider-legacy-to-docker
```
