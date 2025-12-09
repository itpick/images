{ pkgs, lib, ... }:

# TODO: Add tests for headlamp-plugin-flux image
{
  name = "headlamp-plugin-flux";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for headlamp-plugin-flux"
    exit 1
  '';
}
