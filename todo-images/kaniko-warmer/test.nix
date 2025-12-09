{ pkgs, lib, ... }:

# TODO: Add tests for kaniko-warmer image
{
  name = "kaniko-warmer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kaniko-warmer"
    exit 1
  '';
}
