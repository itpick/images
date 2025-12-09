{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-webhook-iamguarded image
{
  name = "cert-manager-webhook-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-webhook-iamguarded"
    exit 1
  '';
}
