# elasticsearch-9.2-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#elasticsearch-9.2-iamguarded

# Load into Docker
nix build .#load-elasticsearch-9.2-iamguarded-to-docker && ./result/bin/load-elasticsearch-9.2-iamguarded-to-docker
```
