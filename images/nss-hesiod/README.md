# nss-hesiod

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nss-hesiod

# Load into Docker
nix build .#load-nss-hesiod-to-docker && ./result/bin/load-nss-hesiod-to-docker
```
