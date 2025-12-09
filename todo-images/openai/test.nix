{ pkgs, lib, ... }:

# TODO: Add tests for openai image
{
  name = "openai";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openai"
    exit 1
  '';
}
