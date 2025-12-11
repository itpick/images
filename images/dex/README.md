# dex

dex is a federated OpenID Connect provider

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dex

# Load into Docker
nix build .#load-dex-to-docker && ./result/bin/load-dex-to-docker
```
