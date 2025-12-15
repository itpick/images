# tcmalloc-minimal

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tcmalloc-minimal

# Load into Docker
nix build .#load-tcmalloc-minimal-to-docker && ./result/bin/load-tcmalloc-minimal-to-docker
```
