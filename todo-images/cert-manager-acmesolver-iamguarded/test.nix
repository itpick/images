{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-acmesolver-iamguarded image
{
  name = "cert-manager-acmesolver-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-acmesolver-iamguarded"
    exit 1
  '';
}
