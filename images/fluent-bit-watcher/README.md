# fluent-bit-watcher

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-bit-watcher

# Load into Docker
nix build .#load-fluent-bit-watcher-to-docker && ./result/bin/load-fluent-bit-watcher-to-docker
```
