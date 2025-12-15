# gptscript

Minimal gptscript container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gptscript

# Load into Docker
nix build .#load-gptscript-to-docker && ./result/bin/load-gptscript-to-docker
```
