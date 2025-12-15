# mdbook

Minimal image that contains mdbook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#mdbook

# Load into Docker
nix build .#load-mdbook-to-docker && ./result/bin/load-mdbook-to-docker
```
