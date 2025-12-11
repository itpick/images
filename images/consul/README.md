# consul

Minimal image with Consul

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#consul

# Load into Docker
nix build .#load-consul-to-docker && ./result/bin/load-consul-to-docker
```
