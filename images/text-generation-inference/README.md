# text-generation-inference

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#text-generation-inference

# Load into Docker
nix build .#load-text-generation-inference-to-docker && ./result/bin/load-text-generation-inference-to-docker
```
