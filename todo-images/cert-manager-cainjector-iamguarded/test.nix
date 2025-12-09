{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-cainjector-iamguarded image
{
  name = "cert-manager-cainjector-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-cainjector-iamguarded"
    exit 1
  '';
}
