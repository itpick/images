# tcmalloc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tcmalloc

# Load into Docker
nix build .#load-tcmalloc-to-docker && ./result/bin/load-tcmalloc-to-docker
```
