{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-controller-iamguarded image
{
  name = "cert-manager-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-controller-iamguarded"
    exit 1
  '';
}
