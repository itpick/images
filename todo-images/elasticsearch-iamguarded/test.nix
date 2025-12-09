{ pkgs, lib, ... }:

# TODO: Add tests for elasticsearch-iamguarded image
{
  name = "elasticsearch-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elasticsearch-iamguarded"
    exit 1
  '';
}
