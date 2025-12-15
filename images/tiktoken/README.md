# tiktoken

tiktoken is a fast BPE tokeniser for use with OpenAI's models

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tiktoken

# Load into Docker
nix build .#load-tiktoken-to-docker && ./result/bin/load-tiktoken-to-docker
```
