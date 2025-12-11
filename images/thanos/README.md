# thanos

Minimal Thanos Image, a highly available Prometheus setup with long term storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#thanos

# Load into Docker
nix build .#load-thanos-to-docker && ./result/bin/load-thanos-to-docker
```
