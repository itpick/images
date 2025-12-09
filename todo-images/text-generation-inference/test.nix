{ pkgs, lib, ... }:

# TODO: Add tests for text-generation-inference image
{
  name = "text-generation-inference";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for text-generation-inference"
    exit 1
  '';
}
