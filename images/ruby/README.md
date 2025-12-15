# ruby

Minimal Ruby base image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ruby

# Load into Docker
nix build .#load-ruby-to-docker && ./result/bin/load-ruby-to-docker
```
