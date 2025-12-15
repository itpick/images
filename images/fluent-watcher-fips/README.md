# fluent-watcher-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-watcher-fips

# Load into Docker
nix build .#load-fluent-watcher-fips-to-docker && ./result/bin/load-fluent-watcher-fips-to-docker
```
