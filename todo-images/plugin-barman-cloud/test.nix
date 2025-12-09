{ pkgs, lib, ... }:

# TODO: Add tests for plugin-barman-cloud image
{
  name = "plugin-barman-cloud";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for plugin-barman-cloud"
    exit 1
  '';
}
