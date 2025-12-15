# vllm-openai-fips

vLLM is a high-throughput and memory-efficient inference engine for Large Language Models (LLMs). This FIPS-validated variant provides OpenSSL FIPS 140-3 compliance for secure, production LLM deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vllm-openai-fips

# Load into Docker
nix build .#load-vllm-openai-fips-to-docker && ./result/bin/load-vllm-openai-fips-to-docker
```
