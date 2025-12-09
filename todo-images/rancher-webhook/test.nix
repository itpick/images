{ pkgs, lib, ... }:

# TODO: Add tests for rancher-webhook image
{
  name = "rancher-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-webhook"
    exit 1
  '';
}
