# deno

Minimal container image for running Deno apps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#deno

# Load into Docker
nix build .#load-deno-to-docker && ./result/bin/load-deno-to-docker
```
