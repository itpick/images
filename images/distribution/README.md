# distribution

The toolkit to pack, ship, store, and deliver container content

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#distribution

# Load into Docker
nix build .#load-distribution-to-docker && ./result/bin/load-distribution-to-docker
```
