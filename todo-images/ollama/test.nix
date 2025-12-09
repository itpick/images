{ pkgs, lib, ... }:

# TODO: Add tests for ollama image
{
  name = "ollama";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ollama"
    exit 1
  '';
}
