{ pkgs, lib, ... }:

# TODO: Add tests for rancher-shell image
{
  name = "rancher-shell";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-shell"
    exit 1
  '';
}
