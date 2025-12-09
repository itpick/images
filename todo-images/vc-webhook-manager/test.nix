{ pkgs, lib, ... }:

# TODO: Add tests for vc-webhook-manager image
{
  name = "vc-webhook-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-webhook-manager"
    exit 1
  '';
}
