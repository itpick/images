{ pkgs, lib, ... }:

# TODO: Add tests for az-iamguarded image
{
  name = "az-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for az-iamguarded"
    exit 1
  '';
}
