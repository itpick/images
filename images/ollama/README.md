# ollama

Get up and running with Llama 3.3, DeepSeek-R1, Phi-4, Gemma 3, Mistral Small 3.1 and other large language models

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ollama

# Load into Docker
nix build .#load-ollama-to-docker && ./result/bin/load-ollama-to-docker
```
