# fluent-bit-watcher-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-bit-watcher-fips

# Load into Docker
nix build .#load-fluent-bit-watcher-fips-to-docker && ./result/bin/load-fluent-bit-watcher-fips-to-docker
```
