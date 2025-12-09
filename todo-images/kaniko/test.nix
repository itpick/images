{ pkgs, lib, ... }:

# TODO: Add tests for kaniko image
{
  name = "kaniko";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kaniko"
    exit 1
  '';
}
