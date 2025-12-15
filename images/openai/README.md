# openai

Minimal image with the OpenAI CLI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openai

# Load into Docker
nix build .#load-openai-to-docker && ./result/bin/load-openai-to-docker
```
