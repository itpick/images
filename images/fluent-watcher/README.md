# fluent-watcher

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-watcher

# Load into Docker
nix build .#load-fluent-watcher-to-docker && ./result/bin/load-fluent-watcher-to-docker
```
