{ pkgs, lib, ... }:

# TODO: Add tests for cfssl image
{
  name = "cfssl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cfssl"
    exit 1
  '';
}
