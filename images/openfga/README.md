# openfga

A high performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#openfga

# Load into Docker
nix build .#load-openfga-to-docker && ./result/bin/load-openfga-to-docker
```
