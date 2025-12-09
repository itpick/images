{ pkgs, lib, ... }:

# TODO: Add tests for teleport image
{
  name = "teleport";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for teleport"
    exit 1
  '';
}
