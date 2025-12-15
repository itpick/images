# ollama-fips

Get up and running with Llama 3.3, DeepSeek-R1, Phi-4, Gemma 3, Mistral Small 3.1 and other large language models

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ollama-fips

# Load into Docker
nix build .#load-ollama-fips-to-docker && ./result/bin/load-ollama-fips-to-docker
```
