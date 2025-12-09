{ pkgs, lib, ... }:

# TODO: Add tests for sealed-secrets-kubeseal image
{
  name = "sealed-secrets-kubeseal";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sealed-secrets-kubeseal"
    exit 1
  '';
}
