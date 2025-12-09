{ pkgs, lib, ... }:

# TODO: Add tests for sealed-secrets-controller image
{
  name = "sealed-secrets-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sealed-secrets-controller"
    exit 1
  '';
}
