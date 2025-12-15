# vllm-openai

vLLM is a high-throughput and memory-efficient inference engine for Large Language Models (LLMs). It provides an OpenAI-compatible API server for production LLM deployments with GPU acceleration

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vllm-openai

# Load into Docker
nix build .#load-vllm-openai-to-docker && ./result/bin/load-vllm-openai-to-docker
```
