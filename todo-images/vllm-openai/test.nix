{ pkgs, lib, ... }:

# TODO: Add tests for vllm-openai image
{
  name = "vllm-openai";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vllm-openai"
    exit 1
  '';
}
