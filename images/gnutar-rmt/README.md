# gnutar-rmt

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnutar-rmt

# Load into Docker
nix build .#load-gnutar-rmt-to-docker && ./result/bin/load-gnutar-rmt-to-docker
```
