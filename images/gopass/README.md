# gopass

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gopass

# Load into Docker
nix build .#load-gopass-to-docker && ./result/bin/load-gopass-to-docker
```
