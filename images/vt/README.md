# vt

Minimal image with the Virus Total CLI - vt-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vt

# Load into Docker
nix build .#load-vt-to-docker && ./result/bin/load-vt-to-docker
```
