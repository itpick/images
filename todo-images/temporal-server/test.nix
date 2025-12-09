{ pkgs, lib, ... }:

# TODO: Add tests for temporal-server image
{
  name = "temporal-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-server"
    exit 1
  '';
}
