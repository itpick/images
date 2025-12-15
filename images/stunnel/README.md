# stunnel

This image contains the CLI for the stunnel networking tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#stunnel

# Load into Docker
nix build .#load-stunnel-to-docker && ./result/bin/load-stunnel-to-docker
```
