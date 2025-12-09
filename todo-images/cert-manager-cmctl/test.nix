{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-cmctl image
{
  name = "cert-manager-cmctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-cmctl"
    exit 1
  '';
}
