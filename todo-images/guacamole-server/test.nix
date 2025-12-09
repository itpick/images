{ pkgs, lib, ... }:

# TODO: Add tests for guacamole-server image
{
  name = "guacamole-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for guacamole-server"
    exit 1
  '';
}
