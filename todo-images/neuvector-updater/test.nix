{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-updater image
{
  name = "neuvector-updater";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-updater"
    exit 1
  '';
}
