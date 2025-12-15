# vela-cli

Reference implementation for Kubevela's vela CLI tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vela-cli

# Load into Docker
nix build .#load-vela-cli-to-docker && ./result/bin/load-vela-cli-to-docker
```
