# neuvector-nstools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-nstools

# Load into Docker
nix build .#load-neuvector-nstools-to-docker && ./result/bin/load-neuvector-nstools-to-docker
```
