# spicedb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spicedb

# Load into Docker
nix build .#load-spicedb-to-docker && ./result/bin/load-spicedb-to-docker
```
