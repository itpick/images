# pgvector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgvector

# Load into Docker
nix build .#load-pgvector-to-docker && ./result/bin/load-pgvector-to-docker
```
