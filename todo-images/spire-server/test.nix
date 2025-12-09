{ pkgs, lib, ... }:

# TODO: Add tests for spire-server image
{
  name = "spire-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-server"
    exit 1
  '';
}
