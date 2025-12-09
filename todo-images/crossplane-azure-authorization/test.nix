{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-azure-authorization image
{
  name = "crossplane-azure-authorization";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-azure-authorization"
    exit 1
  '';
}
