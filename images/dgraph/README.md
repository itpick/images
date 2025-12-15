# dgraph

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dgraph

# Load into Docker
nix build .#load-dgraph-to-docker && ./result/bin/load-dgraph-to-docker
```
