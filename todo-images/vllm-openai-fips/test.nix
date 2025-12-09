{ pkgs, lib, ... }:

# TODO: Add tests for vllm-openai-fips image
{
  name = "vllm-openai-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vllm-openai-fips"
    exit 1
  '';
}
