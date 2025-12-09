{ pkgs, lib, ... }:

# TODO: Add tests for temporal-ui-server image
{
  name = "temporal-ui-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-ui-server"
    exit 1
  '';
}
